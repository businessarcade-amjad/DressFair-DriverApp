import 'dart:developer';
import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/model/delivery_model/delivery_model.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/delivery_shipment/delivery_shipment_repository.dart';
import '../../view/util/widgets/routes/screens_library.dart';

class DeliveryController extends GetxController{
  /// UI label selected
  RxString selectedFilterLabel = "All Record".obs;
  /// UI label -> backend value
  final Map<String, String> filterMap = {
    "All Record": "all",
    "Today": "today",
    "Yesterday": "yesterday",
    "This Week": "thisweek",
    "Last Week": "lastweek",
    "This Month": "thismonth",
    "Last Month": "lastmonth",
    "Custom Range": "custom",
  };

  /// For custom range
  RxString? fullDateFrom="".obs;
  RxString? fullDateTo="".obs;
  Rx<TextEditingController> monthFrom = TextEditingController(text: "09").obs;
  Rx<TextEditingController> dayFrom = TextEditingController(text: "01").obs;
  Rx<TextEditingController> yearFrom = TextEditingController(text: "2025").obs;
  Rx<TextEditingController> monthTo = TextEditingController(text: "01").obs;
  Rx<TextEditingController> dayTo = TextEditingController(text: "01").obs;
  Rx<TextEditingController> yearTo = TextEditingController(text:"2026").obs;

  String get selectedFilterValue =>
      filterMap[selectedFilterLabel.value] ?? "all";
  RxBool showSelectALl=false.obs;
  RxList<DeliveredModel> deliverShipment = <DeliveredModel>[].obs;
  final DeliveryShipmentRepository apiRepository = DeliveryShipmentRepository();

  RxBool isLoading = false.obs;
  RxBool isMoreLoading = false.obs;
  RxBool hasMore = true.obs;

  /// Start page at 1 (important! backend doesn't accept 0)
  int page = 1;

  /// Build API endpoint depending on filter and page.
  String buildEndpoint() {
    final filter = selectedFilterValue;
    if (filter == "all") {
      return page > 1
          ? "${AppUrl.deliveredModelShipment}?page=$page"
          : AppUrl.deliveredModelShipment;
    }
    if (filter == "custom") {
      String endpoint =
          "${AppUrl.deliveredModelShipment}?by_duration=custom&date_from=$fullDateFrom&date_to=$fullDateTo";
      if (page > 1) endpoint += "&page=$page";
      return endpoint;
    }
    String endpoint = "${AppUrl.deliveredModelShipment}?by_duration=$filter";
    if (page > 1) endpoint += "&page=$page";
    return endpoint;
  }

  /// Fetch first page (refresh)
  Future<void> deliveredTask() async {
    try {
      LoginController loginController = Get.put(LoginController());
      isLoading.value = true;

      page = 1;
      hasMore.value = true;
      deliverShipment.clear(); // ✅ clear old data on refresh

      final endpoint = buildEndpoint();
      log("Fetching: $endpoint");

      var response = await apiRepository.getDeliveryShipment(
        token: loginController.token.value,
        pageNo: page,
        url: endpoint,
      );

      if (response != null && response["success"] == true) {
        final shipments = DeliveredModel.listFromJson(response["data"]);
        deliverShipment.assignAll(shipments); // ✅ replace only on refresh

        if (shipments.isEmpty) {
          hasMore.value = false;
          AppToast.showError("No shipments found");
          log("No shipments found on first page");
        } else {
          page++;
          log("Fetched ${shipments.length} shipments (page 1)");
        }
      } else {
        AppToast.showError(response?["message"] ?? "Unknown error");
      }
    } catch (e) {
      AppToast.showError(ErrorHandler.getErrorMessage(e));
      log("Error: ${e.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

  /// Load next page
  Future<void> loadMoreTask() async {
    if (isMoreLoading.value || !hasMore.value) {
      if (!hasMore.value) {
        AppToast.showError("No more data available");
      }
      return;
    }

    try {
      isMoreLoading.value = true;
      LoginController loginController = Get.put(LoginController());

      final endpoint = buildEndpoint();
      log("Load more: $endpoint");

      var response = await apiRepository.getDeliveryShipment(
        token: loginController.token.value,
        pageNo: page,
        url: endpoint,
      );

      if (response != null && response["success"] == true) {
        final shipments = DeliveredModel.listFromJson(response["data"]);

        if (shipments.isNotEmpty) {
          deliverShipment.addAll(shipments);
          page++;
          log("Loaded more: ${shipments.length} (total: ${deliverShipment.length})");
        } else {
          hasMore.value = false;
          AppToast.showError("No more data available");
          log("No more shipments available (page $page)");
        }
      }
    } catch (e) {
      AppToast.showError(ErrorHandler.getErrorMessage(e));
      log("Error load more: ${e.toString()}");
    } finally {
      isMoreLoading.value = false;
    }
  }
}


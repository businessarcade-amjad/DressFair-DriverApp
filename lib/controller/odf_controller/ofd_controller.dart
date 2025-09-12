import 'dart:developer';

import 'package:dressfair_driver_app/controller/internet_connectivity_check/InternetController.dart';
import 'package:dressfair_driver_app/controller/simple_method/location_service.dart';
import 'package:dressfair_driver_app/model/showofd_model/showofd_model.dart';
import 'package:dressfair_driver_app/repository/service/network/api_response.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/ofd_repository/ofd_repository.dart';
import 'package:dressfair_driver_app/view/util/app_toast/app_toast.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/routes_names.dart';
import 'package:get/get.dart';

class OfdController extends GetxController {
  final OfdRepository apiRepository = OfdRepository();
  final LocationService locationService = Get.find<LocationService>();

  RxBool isLoading = false.obs;
  RxList<ShowOfdsModel> allOfd = <ShowOfdsModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    // Recalculate distances whenever location updates
    ever(locationService.latitude, (_) => updateDistances());
    ever(locationService.longitude, (_) => updateDistances());
  }

  /// Update distance for each delivery point
  void updateDistances() {
    final driverLat = locationService.latitude.value;
    final driverLng = locationService.longitude.value;

    if (driverLat == 0.0 && driverLng == 0.0) return;

    for (var ofd in allOfd) {
      if (ofd.deliveryLat.isNotEmpty && ofd.deliveryLng.isNotEmpty) {
        double dist = locationService.calculateDistance(
          driverLat,
          driverLng,
          double.tryParse(ofd.deliveryLat) ?? 0.0,
          double.tryParse(ofd.deliveryLng) ?? 0.0,
        );
        ofd.distanceKm = dist;
      } else {
        ofd.distanceKm = double.infinity;
      }
    }

    // Sort by nearest
    allOfd.sort((a, b) => a.distanceKm!.compareTo(b.distanceKm!));
    allOfd.refresh();
  }

  /// Fetch deliveries (from API)
  Future<void> showAllOfd() async {
    try {
      isLoading.value = true;
      var response = await apiRepository.showOfd();
      if (response != null && response["success"] == true) {
        List<dynamic> dataList = response["data"];
        allOfd.value = dataList.map((e) => ShowOfdsModel.fromJson(e)).toList();
        log("Deliveries loaded: ${allOfd.length}");

        // Update distance after data is fetched
        updateDistances();
      } else {
        log("Error: ${response?["message"]}");
      }
    } catch (e) {
      log("Error fetching OFDs: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Confirm OFD
  Future<void> confirmOfd({required List<String> ofdConfirmIds}) async {
    if (await InternetController.checkUserConnection()) {
      try {
        isLoading.value = true;
        var response = await apiRepository.ofdConfirm(ids: ofdConfirmIds);
        if (response != null && response["success"] == true) {
          AppToast.showError(response["message"]);
          log("Response == $response}");
          Get.offNamed(ofdScreenMain);
        } else {
          AppToast.showError(response["message"]);
        }
      } catch (e) {
        log("Error: ${e.toString()}");
        AppToast.showError(ErrorHandler.getErrorMessage(e));
      } finally {
        isLoading.value = false;
      }
    } else {
      AppToast.showError("Internet Disconnected");
    }
  }
}

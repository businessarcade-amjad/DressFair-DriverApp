import 'dart:developer';
import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/model/pending_task/pending_task.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/pending_shipment/pending_shipment_repository.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class PendingTaskController extends GetxController{
  RxString selectedFilter = "All Record".obs;
  final RxList<String> filters = <String>[
    "All Record",
    "Today",
    "Yesterday",
    "Last 2 days",
    "Last 3 days",
    "Last week",
    "Last month"
  ].obs;

  RxList<PendingShipment> pendingShipment =<PendingShipment>[].obs;
  final PendingShipmentRepository apiRepository = PendingShipmentRepository();
  RxBool isLoading = false.obs;
  Future<void> pendingTask()async{
      try{
        LoginController loginController =Get.put(LoginController());
        isLoading.value=true;
        var response= await apiRepository.getPendingShipment(token:loginController.token.value);
        if (response != null && response["success"] == true) {

          /// ✅ Parse into model list
          final shipments = PendingShipment.listFromJson(response["data"]);
          /// ✅ Assign to observable list
          pendingShipment.assignAll(shipments);
          /// Debug print
          log("First address: ${shipments.first.toAddress}");
          log("Total pending shipments: ${shipments.length}");

        }else{
          AppToast.showError( response["message"]);

        }
        isLoading.value=false;
      }catch(e){
        isLoading.value=false;
        log("Error: ${e.toString()}");

        AppToast.showError( e.toString());
      }
    }


  }

import 'dart:developer';
import 'package:dressfair_driver_app/model/showofd_model/showofd_model.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/ofd_repository/ofd_repository.dart';
import '../../view/util/widgets/routes/screens_library.dart';

class OfdController extends GetxController{
  final OfdRepository apiRepository = OfdRepository();
  RxBool isLoading = false.obs;

  RxList<ShowOfdsModel> allOfd=<ShowOfdsModel>[].obs;
  Future<void> confirmOfd({required List<String> ofdConfirmIds})async {
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
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        log("Error: ${e.toString()}");
        AppToast.showError(ErrorHandler.getErrorMessage(e));
      }
    }
    else {
      AppToast.showError("Internet Disconnected");
    }
  }

  Future<void> showAllOfd()async{
    if (await InternetController.checkUserConnection()) {
    try{
      isLoading.value=true;
      var response= await apiRepository.showOfd();
      if (response != null && response["success"] == true) {
        List<dynamic> dataList = response["data"];
        allOfd.value = dataList.map((e) => ShowOfdsModel.fromJson(e)).toList();
        log("Response 12 == $response");
        log("List =${allOfd.first.deliveryLng}");
      }else{
        AppToast.showError( response["message"]);
      }
      isLoading.value=false;
    }catch(e){
      isLoading.value=false;
      log("Error 123: ${e.toString()}");
      AppToast.showError(ErrorHandler.getErrorMessage(e));

  }
    }else{
      AppToast.showError("Internet Disconnected");
  }
  }
}
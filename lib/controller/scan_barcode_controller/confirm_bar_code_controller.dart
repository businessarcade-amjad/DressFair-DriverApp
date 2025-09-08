import 'dart:developer';
import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/scan_barcode_repository/confirmed_bar_code_repository.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class ConfirmBarCodeController extends GetxController{

  final ConfirmBarCodeRepository apiRepository = ConfirmBarCodeRepository();
  RxBool isLoading = false.obs;
  Future<void> confirmBarCode({required List<String> barCodeIds})async{
    try{
      LoginController loginController =Get.put(LoginController());
      isLoading.value=true;
      var response= await apiRepository.confirmBarCode(barCodeIds: barCodeIds, token:loginController.token.value );
      if (response != null && response["success"] == true) {
        AppToast.showError( response["message"]);
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
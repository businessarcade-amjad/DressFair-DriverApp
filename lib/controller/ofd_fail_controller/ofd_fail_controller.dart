import 'dart:developer';
import 'package:dressfair_driver_app/controller/odf_controller/ofd_controller.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/ofd_fail_repository/ofd_fail_repository.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:http/http.dart' as http;
class  OfdFailController extends GetxController {
  Rx<TextEditingController> remarkController = TextEditingController().obs;
  final OfdFailRepository apiRepository = OfdFailRepository();
  OfdController ofdController=Get.put(OfdController());
  clearingLoginTextField() {
    remarkController.value.clear();
  }
  RxBool isLoading = false.obs;
  Future<void> odfFailStatus({
    required String productID,
    required String failStatusId,
    required String remarks,
  })async{
    var response;
    if (await InternetController.checkUserConnection()) {
    try{
      isLoading.value=true;
      response= await apiRepository.odfFail(productID: productID, failStatusId: failStatusId, remarks: remarkController.value.text);
      if (response != null && response["success"] == true) {
        log("");

        ofdController.allOfd.removeWhere((item) => item.spAwbNumber == productID);

        AppToast.showSuccess( response["message"]);
  clearingLoginTextField();
Get.offNamed(homeScreen);
      }else{
        AppToast.showError( response["message"]);
      }
      isLoading.value=false;
    }catch(e) {
      isLoading.value = false;
      log("Error 12344: $e");
      AppToast.showError(ErrorHandler.getErrorMessage(e));
    }
    }
  else{
      AppToast.showError("Internet Disconnected");
  }}
}
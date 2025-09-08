import 'dart:developer';

import 'package:dressfair_driver_app/model/scan_barcode_model/scan_barcode_scanner.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/scan_barcode_repository/scan_bar_code_repository.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class ScanBarcodeController extends GetxController{
RxString barCodeId="".obs;
  RxList<ScanBarcodeScannerModel> allProductPick=<ScanBarcodeScannerModel>[

  ].obs;
final ScanBarCodeRepository apiRepository = ScanBarCodeRepository();
RxBool isLoading = false.obs;
Future<void> scanBarCode({required String barCodeId})async{
  try{
    isLoading.value=true;
    var response= await apiRepository.scanBarCode(barCodeId:barCodeId);
    if (response != null && response["success"] == true) {
      final shipment = ScanBarcodeScannerModel.fromJson(response["data"]);

      bool alreadyExists = allProductPick.any((item) => item.id == shipment.id);

      if (!alreadyExists) {
        allProductPick.add(shipment);
        AppToast.showSuccess("Shipment added: ${shipment.spAwbNumber}");
      Get.back();
      } else {
        AppToast.showError("This shipment already exists!");
      }
    }else{
      AppToast.showError( response["message"]);
      barCodeId="";
    }
    isLoading.value=false;
  }catch(e){
    isLoading.value=false;
    log("Error: ${e.toString()}");
    barCodeId="";
    AppToast.showError( e.toString());
  }
}


}
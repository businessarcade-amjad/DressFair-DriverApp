import 'dart:developer';

import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/repository/service/network/api_services.dart';

import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart' ;
import 'package:get/get.dart';


class ScanBarCodeRepository{


  final BaseApiServices _apiServices = NetworkApiService();

LoginController loginController=Get.put(LoginController());

  //  SignIn
  Future<dynamic> scanBarCode({
    required String barCodeId,

  }) async {

    log("Emd Point == ${AppUrl.scanPickUP+barCodeId}");
    try {
      dynamic response = await _apiServices.fetchGetResponse(
          AppUrl.scanPickUP+barCodeId,
          token:loginController.token.value
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

}
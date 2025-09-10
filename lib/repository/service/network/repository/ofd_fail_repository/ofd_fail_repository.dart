import 'dart:developer';

import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/repository/service/network/api_services.dart';

import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class OfdFailRepository{

  final BaseApiServices _apiServices = NetworkApiService();
LoginController loginController=Get.put(LoginController());
  //  SignIn
  Future<dynamic> odfFail({
  required String productID,
  required String failStatusId,
  required String remarks,

  }) async {
  Map<String, String> body={
  "sp_awb_number": productID,
  "failed_status_id": failStatusId,
  "remarks": remarks,
  };
log("Body == ${body}");
  try {
  dynamic response = await _apiServices.sendPutRequest(
  AppUrl.ofdFail,
  body,
    token:loginController.token.value
  );
  return response;
  } catch (e) {
  debugPrint(e.toString());
  return {};
  }

  }



}
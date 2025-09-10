import 'dart:developer';

import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/repository/service/network/api_services.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class OfdRepository{

  final BaseApiServices _apiServices = NetworkApiService();
  LoginController loginController=Get.put(LoginController());

  Future<dynamic> ofdConfirm({
  required List<String> ids,


  }) async {
  Map<String, List<String>> body={
  "sp_awb_numbers": ids,
  };

  try {
  dynamic response = await _apiServices.sendPostRequest(
  AppUrl.ofd,
  body,
    token: loginController.token.value
  );
  return response;
  } catch (e) {
  debugPrint(e.toString());
  return {};
  }
  }


  Future<dynamic> showOfd() async {
    try {
      dynamic response = await _apiServices.fetchGetResponse(
          AppUrl.showOfd,
          token: loginController.token.value
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
  }





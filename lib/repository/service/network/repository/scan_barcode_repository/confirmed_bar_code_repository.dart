import 'package:dressfair_driver_app/repository/service/network/api_services.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart' ;

class ConfirmBarCodeRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  //  SignIn
  Future<dynamic> confirmBarCode({
    required List<String> barCodeIds,
    required String token,
  }) async {
    Map<String, List<String>> body={
      "sp_awb_numbers": barCodeIds
      //barCodeIds,
    };
    try {
      dynamic response = await _apiServices.sendPostRequest(
          AppUrl.confirmBarCode,
          body,
          token:token
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
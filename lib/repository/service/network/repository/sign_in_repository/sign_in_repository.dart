import 'package:dressfair_driver_app/repository/service/network/api_services.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class SignInRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  //  SignIn
  Future<dynamic> signInApi({
    required String mobile,
    required String password,
  }) async {
    Map<String, String> body={
      "mobile": mobile,
      "password": password,
    };
    try {
      dynamic response = await _apiServices.sendPostRequest(
        AppUrl.login,
        body,
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}

import 'package:dressfair_driver_app/repository/service/network/api_services.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart' ;

class PendingShipmentRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  //  SignIn
  Future<dynamic> getPendingShipment({
    required String token,
  }) async {

    try {
      dynamic response = await _apiServices.fetchGetResponse(
          AppUrl.pendingShipment,
          token:token
      );
      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
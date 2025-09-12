import 'package:dressfair_driver_app/repository/service/network/api_services.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart' ;

class ReturnedShipmentRepository{
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> getReturnedShipment({
    required String token,
    required int pageNo,
    required String url
  }) async {
    try {
      dynamic response;
      if(pageNo==0){
        response = await _apiServices.fetchGetResponse(
            url,
            token:token
        );
      }else{
        //var appUrl="${AppUrl.pendingShipment}?page$pageNo";
        // log("Pending App Url =$appUrl");
        response = await _apiServices.fetchGetResponse(
            url,
            token:token
        );

      }

      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }
}
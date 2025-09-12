import 'package:dressfair_driver_app/repository/service/network/api_services.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart' ;

class DeliveryShipmentRepository{
  final BaseApiServices _apiServices = NetworkApiService();


  Future<dynamic> getDeliveryShipment({
    required String token,
    required int pageNo,
    required String url
  })
  async {
    try {
      dynamic response;
      if(pageNo==0){
        response = await _apiServices.fetchGetResponse(
            url,
            token:token
        );
      }else{
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



  Future<dynamic> confirmDeliver({
    required String token,
    required String sp_awb_number,
    required String url,
    required int is_signed
  })
  async {
    Map<String, dynamic> body={
      "sp_awb_number": sp_awb_number,
      "is_signed": is_signed,
    };

    try {
      dynamic response;
      response = await _apiServices.sendPostRequest(url, body,
        token: token

      );


      return response;
    } catch (e) {
      debugPrint(e.toString());
      return {};
    }
  }

}
// import 'package:flutter/material.dart';
// import 'package:health_book/repository/service/network/api_services.dart';
// import 'package:health_book/view/utlis/constants/app_urls.dart';
// import 'package:health_book/view/utlis/shared_prefrences/user_prefrences.dart';
//
// class AllFilteredDataRepository {
//   final BaseApiServices _apiServices = NetworkApiService();
//
//   //  Get All Providers:
//   Future<dynamic> getAllFilteredDataApi() async {
//     try {
//       String token = UserPreferences.getToken() ?? "";
//       dynamic response =
//           await _apiServices.fetchGetResponse(AppUrl.allFilters, token: token);
//       return response;
//     } catch (e) {
//       debugPrint(e.toString());
//       return {};
//     }
//   }
// }

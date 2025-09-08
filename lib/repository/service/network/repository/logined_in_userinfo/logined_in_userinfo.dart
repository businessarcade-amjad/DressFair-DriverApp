// import 'package:flutter/material.dart';
//
//
// class LogInInUserInfoRepository {
//   final BaseApiServices _apiServices = NetworkApiService();
//
//   //  User All InFo
//   Future<dynamic> loginUserInFoApi() async {
//     try {
//       String token = UserPreferences.getToken() ?? "";
//       dynamic response = await _apiServices
//           .fetchGetResponse(AppUrl.loginUserInfo, token: token);
//       return response;
//     } catch (e) {
//       debugPrint(e.toString());
//       return {};
//     }
//   }
// }

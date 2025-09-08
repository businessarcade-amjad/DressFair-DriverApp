import 'dart:convert';
import 'dart:developer';

import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/model/user_profile_model/user_profile_model.dart';
import 'package:dressfair_driver_app/view/util/shared_prefrences/pref_keys.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
    LoginController loginController = Get.put(LoginController());

    // Restore token + login state
    loginController.token.value = getToken() ?? "";
    loginController.isUserLoginIn.value = getIsUserLogin() ?? false;

    // Restore user profile if available
    final profileJson = getUserProfile();
    if (profileJson != null) {
      loginController.profile.value =
          Profile.fromJson(jsonDecode(profileJson));
    }

    log("Is User Login In == ${loginController.isUserLoginIn.value}");
    log("User Token == ${loginController.token.value}");
    log("User Profile == ${loginController.profile.value?.toJson()}");
  }

  static Future setToken(String value) async =>
      await _preferences!.setString(PrefKeys.userToken, value);

  static Future setIsUserLogin(bool value) async =>
      await _preferences!.setBool(PrefKeys.isUserLogin, value);

  // Getters

  static String? getToken() => _preferences!.getString(PrefKeys.userToken);

  static bool? getIsUserLogin() => _preferences?.getBool(PrefKeys.isUserLogin)??false;

  // Clear
  static Future<void> removeToken() => _preferences!.remove(PrefKeys.userToken);

  static Future<void> removeIsUserLogin() =>
      _preferences!.remove(PrefKeys.isUserLogin);

  static Future setUserProfile(Profile profile) async {
    final jsonString = jsonEncode(profile.toJson());
    await _preferences!.setString(PrefKeys.userProfile, jsonString);
  }

  static String? getUserProfile() =>
      _preferences!.getString(PrefKeys.userProfile);

  static Future<void> removeUserProfile() =>
      _preferences!.remove(PrefKeys.userProfile);
}


import 'dart:developer';
import 'package:dressfair_driver_app/model/user_profile_model/user_profile_model.dart';
import 'package:dressfair_driver_app/repository/service/network/repository/sign_in_repository/sign_in_repository.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:http/http.dart' as http;
class LoginController extends GetxController {
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  final SignInRepository apiRepository = SignInRepository();
   RxList<String> countryCodes = [
    "971",
    "968",
  ].obs;
  RxString token = "".obs;
  RxString selectedCode = "971".obs;
  RxBool isObSecure = false.obs;
  RxBool isUserLoginIn = false.obs;
  ///Profile Data:
  var profile = Rxn<Profile>();
  void setUser(Profile info) => profile.value = info;
  void clearUser() => profile.value = null;
  ///
  clearingLoginTextField() {
    phoneController.value.clear();
    passwordController.value.clear();
  }
  RxBool isLoading = false.obs;
Future<void> signInApi()async{
  var response;
  try{
    isLoading.value=true;
    var fullNo=selectedCode.value+phoneController.value.text.toString();
   response= await apiRepository.signInApi(mobile:fullNo, password: passwordController.value.text.toString());
    if (response != null && response["success"] == true) {
      await UserPreferences.setToken(response['token']);
      await UserPreferences.setIsUserLogin(true);
      token.value = response['token'];
      isUserLoginIn.value=true;
      AppToast.showSuccess( response["message"]);
      // Profile:
      final profileData = Profile.fromJson(response['data']);
      setUser(profileData);
      await UserPreferences.setUserProfile(profileData);
      Get.offNamed(homeScreen);
      clearingLoginTextField();
    }else{
      AppToast.showError( response["message"]);
    }
    isLoading.value=false;
  }catch(e) {
    isLoading.value = false;
    log("Error: $e");
    AppToast.showError(ErrorHandler.getErrorMessage(e));
  }
}
}
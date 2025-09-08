import 'dart:developer';
import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/view/util/constant/image_constant.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController signInController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    Future.delayed( Duration(seconds: 3)).then((value) async {
    log('IsUSer  Login ==${signInController.isUserLoginIn.value}');
      if (!signInController.isUserLoginIn.value) {

Get.offNamed(loginInScreen);
      }else{
        Get.toNamed(homeScreen);
      }

    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Center(
            child: Container(

              height: 160.h,
              width: 160.w,
              decoration: BoxDecoration(
                image: DecorationImage(image:AssetImage(AppImages.splashLogo))
              ),
            ),
          )
        ],
      ),

    );
  }
}

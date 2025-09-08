import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';



class FillButton extends StatelessWidget {
  double height;
  double width;
  double borderRadius;
  VoidCallback onTap;
  TextStyle textStyle;
  Color containerColor;
  String text;

  FillButton(
      {super.key,
        required this.width,
        required this.height,
        required this.onTap,
        required this.textStyle,
        required this.borderRadius,
        this.containerColor = AppColors.primaryColor,
        required this.text});
  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       GestureDetector(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(borderRadius)),
          child:loginController.isLoading.value?Center(child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.0.h),
            child: CircularProgressIndicator(color: Colors.white,),
          )): Center(
              child: Text(
                text,
                style: textStyle,
              )),
        ),
      ),
    );
  }
}

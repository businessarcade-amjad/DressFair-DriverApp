import 'dart:developer';
import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return  OrangeStatusBar(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Obx(
            ()=>
           SingleChildScrollView(
             padding: EdgeInsets.only(
               bottom: MediaQuery.of(context).viewInsets.bottom,
             ),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:[
                90.0.h.sh,
                Center(
                  child: Container(
                    height: 150.h,
                    width: 140.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppImages.splashLogo))
                    ),
                  ),
                ),
                20.0.h.sh,
                Padding(
                  padding:  EdgeInsets.only(left: 40.0.w),
                  child: Text(AppText.signInYourAccount,style: TextStyle(
                    fontSize: 15.sp
                  ),),
                ),
                18.0.h.sh,
                       Center(
              child: Container(
                height: 50.h,
                width: 330.w,
                decoration: BoxDecoration(
                  color:AppColors.greyColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5.r)
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                       Padding(
              padding:  EdgeInsets.only(left: 12.0.w),
              child: Text("Mobile",style: TextStyle(
                fontSize: 15.sp,
                color: Colors.black.withOpacity(0.8.sp)
              ),),
                       ),

                       Padding(
              padding:EdgeInsets.only(left: 8.0.w,top: 0.h),
              child: Container(
                //color: Colors.red,
                  width: 60.w,
                  //height: 70.h,
                  child: DropdownButtonFormField<String>(
                   // icon: Transform.rotate(
                     // angle: 0,
                      //5.5416, // radians (π = 180 degrees)
                      //child: Icon(
                        //Icons.arrow_drop_down_outlined,
                        //color: Colors.black.withOpacity(0.7),
                        //size: 40,
                      //),
                    //),

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    value:loginController.selectedCode.value,
                    items:loginController.countryCodes.map((code) {
              return DropdownMenuItem(
                value: code,
                child: Text(code,style: TextStyle(
                   fontSize: 16.sp ,
                  color: Colors.black.withOpacity(0.6.sp)
                ),),
              );
                    }).toList(),
                    onChanged: (value) {
                      loginController.selectedCode.value=value??'971';
             // setState(() {
               // selectedCode = value;
              //});
                    },
                  ),
                ),
                       ),
                      // Container(
                           //width: 10.w,
                        //   height: 40.h,
                          // color: Colors.yellow,
                          // child: Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Icon(Icons.arrow_drop_down_sharp,size: 30.sp,))),
                       Padding(
              padding: EdgeInsets.only(left: 5.0.w),
              child: Container(
               // color: Colors.green,
                width: 170.w,
               // height: 38.h,
                child: TextField(
                  controller: loginController.phoneController.value,
                  cursorColor: AppColors.primaryColor,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 8.w,
                    ),
                    hintText: "528652260",
                    hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black.withOpacity(0.8)),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(9),
                  ],
                  keyboardType: TextInputType.phone,
                ),
              ),
                       )

                  ],
                ),
              ),
                       ),
                22.0.h.sh,
                Padding(
                  padding:  EdgeInsets.only(left: 0.0.w),
                  child: Center(
                    child: Container(
                      height: 50.h,
                      width: 330.w,
                      decoration: BoxDecoration(
                          color:AppColors.greyColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(5.r)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Text("Password",style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.black.withOpacity(0.8.sp)
                            ),),
                          ),
                          10.w.sh,

                          Padding(
                            padding: EdgeInsets.only(left: 10.0.w),
                            child: Container(
                              width: 190.w,
                              //height: 38.h,
                             // color: Colors.red,
                              child: TextField(
                                controller: loginController.passwordController.value,
                                obscureText: true,
                                cursorColor: AppColors.primaryColor,
                                style: TextStyle(
                                  fontSize: 18.sp, // 🔹 increase text size
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(
                                    //vertical: 12.h,
                                    horizontal: 8.w,
                                  ),
                                  hintText: "Enter Your Password",
                                  hintStyle: TextStyle(fontSize: 15.sp, color: Colors.black.withOpacity(0.8)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                30.h.sh,
                       Center(
              child: FillButton(width: 330.w, height: 50.w, onTap: () async {
                if(loginController.phoneController.value.text.isEmpty){
                  AppToast.showError("Mobile No Must Not be Empty");
                }else if(loginController.passwordController.value.text.isEmpty){

                log("Tapping  ${loginController.passwordController.value.text} and password =${loginController.phoneController.value.text}");
                 AppToast.showError("Password Must Not be Empty");
              }else{
                 await loginController.signInApi();

                }},
                  textStyle: TextStyle(
              color: AppColors.whiteColor,
                       fontWeight: FontWeight.bold,
                       fontSize: 16.sp
                  ), borderRadius: 7.r, text: "Continue"),
                       )

                 ] ),
           ),
        ),
      ) );
  }
}

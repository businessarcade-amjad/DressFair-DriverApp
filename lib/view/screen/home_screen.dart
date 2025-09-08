import 'package:dressfair_driver_app/controller/login_controller.dart';
import 'package:dressfair_driver_app/view/util/dialog/loading_dialog.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return OrangeStatusBar(
      child: Scaffold(
        backgroundColor: Colors.white,
          body: Column(
              children: [
                Container(
                  height: 350.h,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 290.h,
                        decoration: BoxDecoration(
                          color: Colors.orange.withOpacity(0.8),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(110.r),
                            bottomRight: Radius.circular(110.r),
                          ),
                        ),
                        padding:  EdgeInsets.symmetric(
                            vertical: 40.h, horizontal: 20.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              loginController.profile.value?.name.toString()??"",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              loginController.profile.value?.mobile_number.toString()??"",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              "www.businessarcade.com",
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            40.h.sh,


                          ],
                        ),

                      ),
                  Positioned(
                    bottom: 0,
                      child:
                      FeatureCards(text1: 'PICKUP',icon1:AppImages.pickupIcon, text2:'PENDING',icon2:AppImages.pendingIcon, onTap1:(){
                        Get.toNamed(mainPickupScreen);
                      }, onTap2: () {
                        Get.toNamed(pendingScreenMain);
                      },)),

                    ],
                  ),

                ),
                20.h.sh,
                FeatureCards(text1: "DELIVERED", icon1: AppImages.deliveredIcon, text2: 'RETURNED', icon2: AppImages.returnedIcon, onTap1: () {
                  Get.toNamed(deliveredScreenMain);
                }, onTap2: () {
                  Get.toNamed(returnedScreenMain);
                },)

              ])
      ),
    );
  }

}

class FeatureCards extends StatelessWidget {
  String text1;
  String text2;
VoidCallback onTap1;
VoidCallback onTap2;
  String icon1;
  String icon2;
   FeatureCards({super.key,required this.text1,required this.icon1,required this.text2,required this.icon2,required this.onTap1,required this.onTap2});

  @override
  Widget build(BuildContext context) {
    return Container(

width:MediaQuery.sizeOf(context).width,
      //color: Colors.grey,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap1,
              child: Container(
                height: 130.h,
                width: 110.w,

                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2.r,
                        blurRadius: 8.r,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(

                        image: DecorationImage(image: AssetImage(icon1))
                      ),
                    ),
                    10.h.sh,
                    Text(text1,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600
                    ),
                    )

                  ],
                ),
              ),
            ),
            50.w.sw,
            GestureDetector(
              onTap: onTap2,
              child: Container(
                height: 130.h,
                width: 110.w,

                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2.r,
                        blurRadius: 8.r,
                        offset: const Offset(2, 4),
                      ),
                    ],
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(10.r)
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(icon2))
                      ),
                    ),
                    10.h.sh,
                    Text(text2,
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





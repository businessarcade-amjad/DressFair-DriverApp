import 'dart:developer';
import 'package:dressfair_driver_app/controller/simple_method/simple_methode.dart';
import 'package:dressfair_driver_app/view/util/constant/image_constant.dart';
import '../widgets/routes/screens_library.dart';

class MoreButtons extends StatefulWidget {
  VoidCallback yes;
  VoidCallback no;
  MoreButtons({super.key, required this.no, required this.yes});
  @override
  State<MoreButtons> createState() => _MoreButtonsState();
}
class _MoreButtonsState extends State<MoreButtons> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
surfaceTintColor: Colors.white,
      alignment: Alignment.center,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),


      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize:MainAxisSize.min,
          children: [
            26.w.sw,
            GestureDetector(
              onTap:(){
        log("Tapping");
                SimpleMethode.openPhone("+923309189520");
              },
              child: Container(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.callIcon))
                      ),
                    ),
                    5.h.sh,
                    Text("CALL",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
            40.w.sw,
            GestureDetector(
              onTap: () async {
               await SimpleMethode().openWhatsApp("03095953304");
              },
              child: Container(
                height: 100.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage(AppImages.whatsappIcon))
                      ),
                    ),
                    5.h.sh,
                    Text("Whats App",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            ),
            40.w.sw,
            Container(
              color: Colors.white,
              height: 100.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.locationIcon))
                    ),
                  ),
                  5.h.sh,
                  Text("Location",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.w500),)
                ],
              ),
            ),
            26.w.sw,
          ],
        ),
      ),
    );
  }
}

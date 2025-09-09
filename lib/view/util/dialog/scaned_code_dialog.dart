import 'package:dressfair_driver_app/controller/scan_barcode_controller/scan_barcode_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

void showCustomDialog({
  required BuildContext context,
  required String title,
  required String message,
  required VoidCallback onConfirm,
  required VoidCallback cancel,
}) {
  ScanBarcodeController scanBarcodeController=Get.put(ScanBarcodeController());
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Container(
          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: AppColors.primaryColor, size: 60.sp),
               SizedBox(height: 12.h),
              Text(
                title,
                style:  TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

               SizedBox(height: 8.h),

              Text(
                message,
                textAlign: TextAlign.center,
                style:  TextStyle(fontSize: 16.sp, color: Colors.black54),
              ),

               SizedBox(height: 20.h),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    FillButton(
        containerColor: AppColors.primaryColor,
        width: 100.h, height: 40.w, onTap: (){

      cancel();
    }, textStyle: TextStyle(color: Colors.white), borderRadius: 5.r, text: "Cancel"),

    10.w.sw,
             Obx(()=>
        GestureDetector(
        onTap: (){onConfirm();},
        child: Container(
          height: 40.h,
          width: 100.w,
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(3.r)),
          child:scanBarcodeController.isLoading.value?Center(child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 1.0.w,vertical: 1.0.h),
            child: Container(
              height: 10.h,
              width: 10.w,
              child: CircularProgressIndicator(
                strokeWidth: 1,
value: 0.5,
                color: Colors.white,),
            ),
          )): Center(
              child: Text(
                "Save",
                style: TextStyle(
      color: Colors.white
      ),
              )),
        ),
      ),
      ),

  ],
),

            ],
          ),
        ),
      );
    },
  );
}

import 'package:dressfair_driver_app/controller/scan_barcode_controller/confirm_bar_code_controller.dart';
import 'package:dressfair_driver_app/controller/scan_barcode_controller/scan_barcode_controller.dart';
import 'package:dressfair_driver_app/view/util/dialog/scaned_code_dialog.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class MainPickupScreen extends StatefulWidget {
  const MainPickupScreen({super.key});
  @override
  State<MainPickupScreen> createState() => _MainPickupScreenState();
}

class _MainPickupScreenState extends State<MainPickupScreen> {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: false,
    facing: CameraFacing.back,
  );
  ScanBarcodeController allProductPickController=Get.put(ScanBarcodeController());
  ConfirmBarCodeController confirmBarCodeController=Get.put(ConfirmBarCodeController());
  bool isScanned = false;
  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=>

          Scaffold(
        floatingActionButton:FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          onPressed:(){
            controller.toggleTorch();
          },
          child: const Icon(Icons.flash_on,color:Colors.white),
        ),
        appBar:AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Scan Shipment",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          actions:[
            allProductPickController.allProductPick.isNotEmpty?
            Padding(
              padding: EdgeInsets.only(right: 10.0.w),
              child: GestureDetector(
                onTap:() async {
                 if(allProductPickController.allProductPick.isNotEmpty){
                   await  confirmBarCodeController.confirmBarCode(barCodeIds: []);
                 }else{
                   AppToast.showInfo("Please Scan Code First");
                 }

                  //Get.offNamed(allProductPickScreen);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  height: 40.h,
                  width: 140.w,
                  child:confirmBarCodeController.isLoading.value?
                  Container(
                    height: 5.h,
                    width: 5.w,
                    child: Center(child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.0.w,vertical: 2.0.h),
                      child: CircularProgressIndicator(
                        strokeWidth: 2.w,
                        color: Colors.white,
                      ),
                    )),
                  ): const Center(
                    child: Text(
                      "Confirm Pick UP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ):SizedBox()
          ],
        ),
        body: Column(
          children: [
            10.h.sh,
            // Scanner Area:
            SizedBox(
              width: MediaQuery.sizeOf(context).width*0.93,
              height: 140.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: MobileScanner(
                      controller: controller,
                        onDetect: (capture) async {
                          if (isScanned) return;
                          final barcode = capture.barcodes.firstOrNull;
                          final code = barcode?.rawValue ?? "";
                          if (code.isNotEmpty) {
                            setState(() => isScanned = true);
                            await controller.stop();
                            if (allProductPickController.barCodeId.contains(code)) {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: "Duplicate",
                                text: "This is already scanned!",
                                confirmBtnColor: Colors.red,
                                onConfirmBtnTap:() async {
                                  Navigator.pop(context);
                                  await controller.start();
                                  setState(() => isScanned = false);
                                },
                              );
                            } else {
                              allProductPickController.barCodeId.value = code;
                              showCustomDialog(
                                title: 'Scan Successfully',
                                message: 'Save Scanned Qr Code Now',
                                onConfirm: () async {
                                  if (allProductPickController.barCodeId.value.isNotEmpty) {
                                    await allProductPickController.scanBarCode(
                                      barCodeId: allProductPickController.barCodeId.value,
                                    );
                                  }
                                  await controller.start();
                                  setState(() => isScanned = false);
                                  Get.back();
                                },
                                cancel: () async {
                                  allProductPickController.barCodeId.value = "";
                                  Get.back();
                                  await controller.start();
                                  setState(() => isScanned = false);
                                }, context: context,
                              );
                            }
                          }
                        }

                    ),
                  ),

                  // White border frame
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.w),
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.transparent,
                    ),
                  ),
                ],
              ),
            ),
             SizedBox(height: 12.h),
            scanCard(),
          ],
        ),
      ),
    );
  }

  Widget scanCard(){
    return Expanded(
      child: Obx(
          (){
            final items = allProductPickController.allProductPick;
            if (items.isEmpty) {
              return  Center(child: Text("No products scanned yet",style: TextStyle(fontSize: 16.sp,fontWeight:FontWeight.bold),));
            }
         return   ListView.builder(
                itemCount: items.length,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0.w,right: 8.0.w,bottom: 10.h,top: 2.h),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 1.r,
                            blurRadius: 1.r,
                            offset: const Offset(2, 4),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.01),
                            spreadRadius: 1.r,
                            blurRadius: 1.r,
                            offset: const Offset(4, 2),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1.r,
                            blurRadius: 1.r,
                            offset: const Offset(-4, 2),
                          ),
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1.r,
                            blurRadius: 1.r,
                            offset: const Offset(4, -2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Get.toNamed(detailPendingScreen);
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                10.h.sh,
                                Container(
                                  width: 260.w,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      10.w.sw,
                                      Text("Order ID:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                                      Text(items[index].spAwbNumber.toString(),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.sp)),

                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      5.h.sh,
                                      10.w.sw,
                                      Text("Payment Status : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                                      Text(items[index].paymentMethod?.name.toString()??"UnKnown",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.sp)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      5.h.sh,
                                      10.w.sw,
                                      Text("City : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                                      10.w.sw,
                                      Container(
                                        width: MediaQuery.sizeOf(context).width*0.7,
                                        child: Text('${items[index].city?.name.toString()??""} ' ,
                                            overflow:TextOverflow.ellipsis,
                                            maxLines:2,
                                            softWrap: true,
                                            style: TextStyle(color:Colors.black,fontWeight:FontWeight.w400,fontSize: 14.sp)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width*0.95,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      5.h.sh,
                                      10.w.sw,

                                      Text("Address : ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 14.sp),),
                                      Container(
                                        width: MediaQuery.sizeOf(context).width*0.7,

                                        child: Text('${items[index].cityArea?.name??""} ${items[index].toAddress??""}}' ,
                                            overflow:TextOverflow.ellipsis,
                                            maxLines:2,
                                            softWrap: true,
                                            style: TextStyle(color:Colors.black,fontWeight:FontWeight.w400,fontSize: 14.sp)),
                                      ),
                                    ],
                                  ),
                                ),
                                10.h.sh,
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });}
      ),
    );
  }

}

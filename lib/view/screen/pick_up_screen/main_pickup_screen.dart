import 'package:dressfair_driver_app/controller/scan_barcode_controller/confirm_bar_code_controller.dart';
import 'package:dressfair_driver_app/controller/scan_barcode_controller/scan_barcode_controller.dart';
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

  ScanBarcodeController allProductPickController = Get.put(
    ScanBarcodeController(),
  );
  ConfirmBarCodeController confirmBarCodeController = Get.put(
    ConfirmBarCodeController(),
  );
  bool isScanned = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      allProductPickController.allProductPick.clear();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Scan Shipment",
            style: TextStyle(fontSize: 20.sp, color: Colors.white),
          ),
          actions: [
            allProductPickController.allProductPick.isNotEmpty
                ? Padding(
                    padding: EdgeInsets.only(right: 10.0.w),
                    child: GestureDetector(
                      onTap: () async {
                        if (allProductPickController
                            .allProductPick
                            .isNotEmpty) {
                          List<String> barcodeIds = allProductPickController
                              .allProductPick
                              .map((item) => item.spAwbNumber ?? "")
                              .toList();
                          await confirmBarCodeController.confirmBarCode(
                            barCodeIds: barcodeIds,
                          );
                        } else {
                          AppToast.showInfo("Please Scan Code First");
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        height: 40.h,
                        width: 140.w,
                        child: confirmBarCodeController.isLoading.value
                            ? Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.0.w,
                                    vertical: 2.0.h,
                                  ),
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2.w,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            : const Center(
                                child: Text(
                                  "Confirm Pick UP",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        body: Column(
          children: [
            10.h.sh,

            // 🔹 Scanner Area
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.93,
              height: 140.h,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Obx(() {
                      if (allProductPickController.isLoading.value) {
                        controller.stop(); // stop scanner
                      } else {
                        controller.start(); // restart scanner
                      }
                      return MobileScanner(
                        controller: controller,
                        onDetect: (capture) async {
                          if (isScanned ||
                              allProductPickController.isLoading.value)
                            return;

                          final barcode = capture.barcodes.firstOrNull;
                          final code = barcode?.rawValue ?? "";

                          if (code.isNotEmpty) {
                            // 🔹 Lock immediately so scanner doesn’t fire again
                            setState(() => isScanned = true);

                            // 🔹 Add delay before processing
                            await Future.delayed(const Duration(seconds: 2));

                            if (allProductPickController.allProductPick.value
                                .contains(code)) {
                              QuickAlert.show(
                                context: context,
                                type: QuickAlertType.error,
                                title: "Duplicate",
                                text: "This is already scanned!",
                                confirmBtnColor: Colors.red,
                                onConfirmBtnTap: () async {
                                  Navigator.pop(context);
                                  setState(
                                    () => isScanned = false,
                                  ); // unlock again
                                },
                              );
                            } else {
                              allProductPickController.barCodeId.value = code;
                              if (allProductPickController
                                  .barCodeId
                                  .value
                                  .isNotEmpty) {
                                await allProductPickController.scanBarCode(
                                  barCodeId:
                                      allProductPickController.barCodeId.value,
                                );
                              }
                              setState(
                                () => isScanned = false,
                              ); // unlock again after API
                            }
                          }
                        },
                      );
                    }),
                  ),

                  // White border frame
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.w),
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.transparent,
                    ),
                  ),

                  // 🔹 Loader overlay when API is loading
                  Obx(
                    () => allProductPickController.isLoading.value
                        ? Center(
                            child: Container(
                              height: 40.h,
                              width: 40.w,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.w),
                                child: CircularProgressIndicator(
                                  strokeWidth: 3.w,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),

            SizedBox(height: 12.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.toggleTorch();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: 14.0.w),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Icon(Icons.flash_on, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 14.0.w),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          allProductPickController.allProductPick.length
                              .toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            10.h.sh,
            scanCard(),
          ],
        ),
      ),
    );
  }

  Widget scanCard() {
    return Expanded(
      child: Obx(() {
        final items = allProductPickController.allProductPick;
        if (items.isEmpty) {
          return Center(
            child: Text(
              "No Shipment scanned yet",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          );
        }
        return ListView.builder(
          itemCount: items.length,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                left: 8.0.w,
                right: 8.0.w,
                bottom: 10.h,
                top: 2.h,
              ),
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
                      onTap: () {
                        Get.toNamed(detailPendingScreen);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          10.h.sh,
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.92,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                10.w.sw,
                                Text(
                                  "Order ID:",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                Text(
                                  items[index].spAwbNumber.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.28,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    items.removeAt(index);
                                  },
                                  child: Container(
                                    width: 32.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                      // border: Border.all(color: Colors.black),
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(3.r),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete_forever,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.04,
                                ),
                                Container(
                                  width: 32.w,
                                  height: 32.h,
                                  decoration: BoxDecoration(
                                    // border: Border.all(color: Colors.black),
                                    color: AppColors.primaryColor,
                                    borderRadius: BorderRadius.circular(3.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      (items.length - index).toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            child: Row(
                              children: [
                                5.h.sh,
                                10.w.sw,
                                Text(
                                  "Payment Status : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Text(
                                  items[index].paymentMethod?.name.toString() ??
                                      "UnKnown",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            child: Row(
                              children: [
                                5.h.sh,
                                10.w.sw,
                                Text(
                                  "City : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                10.w.sw,
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  child: Text(
                                    '${items[index].city?.name.toString() ?? ""} ',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.sizeOf(context).width * 0.95,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                5.h.sh,
                                10.w.sw,
                                Text(
                                  "Address : ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.sizeOf(context).width * 0.7,
                                  child: Text(
                                    '${items[index].cityArea?.name ?? ""} ${items[index].toAddress ?? ""}}',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp,
                                    ),
                                  ),
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
          },
        );
      }),
    );
  }
}

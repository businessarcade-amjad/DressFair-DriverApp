import 'dart:typed_data';
import 'package:dressfair_driver_app/controller/delivery_controller/delivery_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

class DeliverySignScreen extends StatefulWidget {
  String productID;
   DeliverySignScreen({super.key,required this.productID});

  @override
  State<DeliverySignScreen> createState() => _DeliverySignScreenState();
}

class _DeliverySignScreenState extends State<DeliverySignScreen> {
  final GlobalKey<SfSignaturePadState> _signatureKey = GlobalKey();
  final DeliveryController deliveryController = Get.put(DeliveryController());
  Uint8List? _signatureImage;

  Future<void> _saveSignature() async {
    final pathList = _signatureKey.currentState?.toPathList();
    if (pathList == null || pathList.isEmpty) {
      AppToast.showError("Please add signature");
      return;
    }

    final ui.Image image =
    await _signatureKey.currentState!.toImage(pixelRatio: 3.0);
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData == null) {
      AppToast.showError("Failed to capture signature");
      return;
    }

    final pngBytes = byteData.buffer.asUint8List();
    setState(() {
      _signatureImage = pngBytes;
    });
  await  deliveryController.confirmDeliver(productID: widget.productID, isSigned: 1);
    print("Signature saved! Bytes: ${pngBytes.length}");
    // TODO: upload pngBytes or call deliveryController to submit


  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _signatureImage = null;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text(
            "Signature Screen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Confirm Delivery with Signature",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20.h),
              Container(
                height: 250.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: Colors.grey.shade400, width: 1.5.w),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 8.r,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: SfSignaturePad(
                  key: _signatureKey,
                  backgroundColor: Colors.transparent,
                  strokeColor: Colors.black,
                  minimumStrokeWidth: 1.w,
                  maximumStrokeWidth: 3.w,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Sign inside the box above",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              /*
              if (_signatureImage != null) ...[
                SizedBox(height: 20.h),
                Text(
                  "Preview:",
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10.h),
                Container(
                  height: 150.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Image.memory(
                    _signatureImage!,
                    fit: BoxFit.contain,
                  ),
                ),
              ],

               */
              Spacer(),
              Row(
                children: [
                  // Clear button
                  Expanded(
                    child: SizedBox(
                      height: 48.h, // ✅ fixed button height
                      child: ElevatedButton(
                        onPressed: () {
                          _signatureKey.currentState!.clear();
                          setState(() {
                            _signatureImage = null;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.zero, // ✅ prevent extra padding
                        ),
                        child: Text(
                          "Clear",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),

                  // Confirm Delivery button
                  Expanded(
                    child: SizedBox(
                      height: 48.h, // ✅ same height as Clear
                      child: ElevatedButton(
                        onPressed: _saveSignature,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          padding: EdgeInsets.zero, // ✅ prevent extra padding
                        ),
                        child: deliveryController.isLoading.value
                            ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.w,
                            color: Colors.white,
                          ),
                        )
                            : Text(
                          "Confirm Delivery",
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ) ,

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

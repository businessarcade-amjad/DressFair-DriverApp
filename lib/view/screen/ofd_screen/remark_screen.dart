import 'package:dressfair_driver_app/controller/ofd_fail_controller/ofd_fail_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class RemarkScreen extends StatefulWidget {
  String productID;
  String statusCode;
   RemarkScreen({super.key,required this.productID,required this.statusCode});
  @override
  State<RemarkScreen> createState() => _RemarkScreenState();
}

class _RemarkScreenState extends State<RemarkScreen> {
  OfdFailController controller=Get.put(OfdFailController());
  @override
  void initState() {
 WidgetsBinding.instance.addPostFrameCallback((v){
   controller.remarkController.value.clear();
 });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Obx(
      ()=> Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: Text("Remark Screen",style: TextStyle(color: AppColors.whiteColor),),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              60.h.sh,
             Center(child: Text("Add Remark",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16.sp),)),
              50.h.sh,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.0.w),
                child: Container(
                padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 12.h),
                decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                color: Colors.grey.shade400,
                width: 1.5.w,
                ),
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
                ),
                ],
                ),
                child: TextField(
                controller: controller.remarkController.value,
                    maxLines: 5,
                    style:TextStyle(fontSize: 16.sp),
                    decoration: InputDecoration(
                    hintText: "Enter Complete Reason...",
                    border: InputBorder.none,
                    ),
                    ),
                    ),
              ),
              50.h.sh,
          
              GestureDetector(
                onTap: () async {
          await controller.odfFailStatus(productID:widget.productID , failStatusId: widget.statusCode, remarks: controller.remarkController.value.toString());
                },
                child: Container(
          
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(10.r)
                  ),
                  height: 60.h,
                  width: 300.w,
                  child: Center(child:controller.isLoading.value?Center(child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.0.h),
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      backgroundColor:Colors.white,
                    ),
                  )): Text("Submit",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.white))),
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
}}

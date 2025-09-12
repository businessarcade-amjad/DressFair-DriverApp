import 'package:dotted_border/dotted_border.dart';
import 'package:dressfair_driver_app/controller/ofd_fail_controller/ofd_fail_controller.dart';
import 'package:dressfair_driver_app/model/showofd_model/showofd_model.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class RemarkScreen extends StatefulWidget {
  final ShowOfdsModel ofd;
  String statusCode;
  String statusName;
   RemarkScreen({super.key,required this.ofd,required this.statusCode,required this.statusName});
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

              15.h.sh,
              Container(
                width: MediaQuery.sizeOf(context).width*0.93,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Order No:  ${widget.ofd.spAwbNumber}",style: TextStyle(fontWeight:FontWeight.w500),),
                    Container(
                      height: 30.h,
                      width: 140.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: AppColors.primaryColor)
                      ),
                      child: Center(child: Text("${widget.ofd.paymentMethod?.name??""}")),
                    )
                  ],
                ),
              ),
              10.h.sh,
              10.h.sh,
              Container(
                width: MediaQuery.sizeOf(context).width*0.93,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Mobile No : ",style:TextStyle(fontWeight:FontWeight.w400),),
                    Text("${widget.ofd?.toMobile??""}",style:TextStyle(fontWeight:FontWeight.w500),),
                  ],
                ),
              ),
              30.w.sw,
              10.h.sh,
              Container(
                width: MediaQuery.sizeOf(context).width*0.93,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Address: ",style: TextStyle(fontWeight:FontWeight.w400),),
                    Container(

                        width: MediaQuery.sizeOf(context).width*0.7,
                        child: Text("${widget.ofd.toAddress} ${widget.ofd.cityArea?.name??""} ${widget.ofd.city?.name??""}",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight:FontWeight.w400),maxLines: 2,softWrap: true,)),


                  ],
                ),
              ),
              10.h.sh,
              Container(
                width: MediaQuery.sizeOf(context).width*0.93,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Content: ",style: TextStyle(fontWeight:FontWeight.w400),),
                    Container(

                        width: MediaQuery.sizeOf(context).width*0.7,
                        child: Text("${widget.ofd.contents}",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight:FontWeight.w400),maxLines: 2,softWrap: true,)),


                  ],
                ),
              ),



              10.h.sh,
              Container(
                width: MediaQuery.sizeOf(context).width*0.93,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Amount: ",style: TextStyle(fontWeight:FontWeight.w400,color: Colors.red),),
                    Container(
                        width: MediaQuery.sizeOf(context).width*0.7,
                        child: Text("${widget.ofd.amount} ${widget.ofd.currency?.code??"" } ",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight:FontWeight.w400),maxLines: 2,softWrap: true,)),
                  ],
                ),
              ),
              10.h.sh,

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 18.w),
                child: DottedBorder(
                  options: RectDottedBorderOptions(
                    color: AppColors.primaryColor,
                    strokeWidth: 1.5,
                    dashPattern: [6],
                  ),
                  child: const SizedBox(
                    height: 0,
                    width: double.infinity,
                  ),
                ),
              ),
              10.h.sh,
             Center(child: Text("${widget.statusName} Remark",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16.sp),)),
              10.h.sh,
              Padding(
                padding:  EdgeInsets.symmetric(horizontal:10.0.w),
                child: Container(
                padding:  EdgeInsets.symmetric(horizontal:12.w,vertical:12.h),
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
                blurRadius: 6.r,
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
                  if(controller.remarkController.value.text.isEmpty){
                    AppToast.showError("Please Add Remarks");
                  }else{
                    await controller.odfFailStatus(productID:widget.ofd.spAwbNumber,failStatusId:widget.statusCode,remarks: controller.remarkController.value.toString());
                  }
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

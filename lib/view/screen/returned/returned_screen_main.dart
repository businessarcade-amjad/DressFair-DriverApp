import 'package:dressfair_driver_app/controller/pending_task_controller.dart';
import 'package:dressfair_driver_app/view/util/dialog/filter_dialog.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:dressfair_driver_app/view/util/widgets/status_bar_widget/OrangeStatusBar.dart';

class ReturnedScreenMain extends StatefulWidget {
  const ReturnedScreenMain({super.key});

  @override
  State<ReturnedScreenMain> createState() => _ReturnedScreenMainState();
}

class _ReturnedScreenMainState extends State<ReturnedScreenMain> {
  PendingTaskController pendingTaskController=Get.put(PendingTaskController());

  Widget pendingCard(){
    return ListView.builder(
        itemCount: 20,
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
                          //   color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              10.w.sw,
                              Text("Order No:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                              Text("  12345678",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15.sp)),


                            ],
                          ),
                        ),
                        Container(
                          width: 260.w,
                          //color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              5.h.sh,
                              10.w.sw,
                              Text("Mobile No:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                              Text("  971565345225",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.sp)),


                            ],
                          ),
                        ),
                        Container(
                          width: 260.w,
                          //color: Colors.red,
                          child: Row(

                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              5.h.sh,
                              10.w.sw,
                              Text("Address:",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.sp),),
                              Text("  dummy Address",
                                  overflow:TextOverflow.ellipsis,
                                  maxLines:2,
                                  softWrap: true,
                                  style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 14.sp)),
                            ],
                          ),
                        ),
                        10.h.sh,
                      ],
                    ),
                  ),
                  Container(
                    height: 50.h,
                    width: 80.w,
                    //color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: (){
                              Get.toNamed(detailPendingScreen);
                            },
                            child: Icon(Icons.arrow_forward_ios,size: 20.sp,color: Colors.black.withOpacity(0.7),)),
                        20.w.sw,

                      ],
                    ),
                  )
                ],
              ),
            ),
          );

        });

  }
  @override
  Widget build(BuildContext context) {
    return OrangeStatusBar(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            20.h.sh,
            Container(
              height: 75.h,
              width: MediaQuery.sizeOf(context).width,
              color: AppColors.primaryColor,
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0.h),
                    child: Container(
                      height: 35.h,
                      width: MediaQuery.sizeOf(context).width*0.93,
                      decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(2.r)
                      ),
                      child: Row(
                        children: [
                          20.w.sw,
                          Icon(Icons.search,size: 22.sp,color: Colors.black.withOpacity(0.7),),

                          Spacer(),
                          Obx(()=> Padding(
                            padding:  EdgeInsets.only(right: 10.0.w),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: pendingTaskController.selectedFilter.value,
                                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                                dropdownColor: Colors.white,
                                isDense: true,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.7),
                                  fontSize: 16.sp,
                                ),
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.zero,
                                items:pendingTaskController.filters.map((String value) {
                                  return DropdownMenuItem<String>(
                                    value:value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged:(newValue) {
                                  pendingTaskController.selectedFilter.value = newValue!;
                                  showDialog(context: context, builder: (context){
                                    return DateRangeDialog( onCancel: () {  Navigator.pop(context);}, onOk: () {Navigator.pop(context);  },);
                                  });


                                },
                              ),
                            ),
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),



            Expanded(child: pendingCard()),

          ],
        ),
      ),
    );
  }
}


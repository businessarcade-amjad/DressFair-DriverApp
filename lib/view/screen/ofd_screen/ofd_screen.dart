import 'dart:developer';
import 'package:dressfair_driver_app/controller/odf_controller/ofd_controller.dart';
import 'package:dressfair_driver_app/view/util/dialog/more_button_dialog.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class OfdScreenMain extends StatefulWidget {
  const OfdScreenMain({super.key});
  @override
  State<OfdScreenMain> createState() => _OfdScreenMainState();
}
class _OfdScreenMainState extends State<OfdScreenMain> {
  final OfdController ofdController =
  Get.put(OfdController());
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ofdController.allOfd.clear();
      //pendingTaskController.selectedFilterLabel.value="All Record";
      ofdController.showAllOfd();
    });

  /*  _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        pendingTaskController.loadMoreTask();
      }
    });*/
  }

  Widget pendingCard() {
    if (ofdController.isLoading.value) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (ofdController.allOfd.isEmpty) {
      return Center(
        child: Text(
          "No Data Found",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: ofdController.allOfd.length,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {

          var item = ofdController.allOfd[index];
          return Padding(
            padding: EdgeInsets.only(
                left: 8.0.w, right: 8.0.w, bottom: 10.h, top: 2.h),
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
                      log("Location 0== ${item.deliveryLng}");
                      Get.toNamed(detailOfdScreen, arguments: item);
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        10.h.sh,
                        Container(
                          width: 260.w,
                          child: Row(
                            children: [
                              10.w.sw,
                              Text("Order No : ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp)),
                              Text(item.spAwbNumber ?? "",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp)),
                            ],
                          ),
                        ),
                        2.h.sh,
                        Container(
                          width: 260.w,
                          child: Row(
                            children: [
                              10.w.sw,
                              Text("Mobile No:",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp)),
                              Text(item.toMobile,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp)),
                            ],
                          ),
                        ),
                        2.h.sh,
                        Container(
                          width: MediaQuery.sizeOf(context).width * 0.73,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.w.sw,
                              Text("Address : ",
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp)),
                              Container(
                                width: MediaQuery.sizeOf(context).width * 0.49,
                                child: Text(
                                  "${item.cityArea?.name ?? ""} ${item.toAddress}",
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.sp),
                                ),
                              ),
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
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(detailOfdScreen, arguments: item);
                          },
                          child: Icon(Icons.arrow_forward_ios,
                              size: 20.sp,
                              color: Colors.black.withOpacity(0.7)),
                        ),

                        20.w.sw,
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return MoreButtons(no: () {}, yes: () {});
                              },
                            );
                          },
                          child: Container(
                            height: 18.h,
                            width: 18.w,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.more),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        //else {
          // Bottom loader
          /*return pendingTaskController.isMoreLoading.value
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: CircularProgressIndicator(
                    color: AppColors.primaryColor)),
          )
              : SizedBox.shrink();*/
     //   }
     // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => OrangeStatusBar(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: Text("Out For Delivery",style: TextStyle(fontSize: 18.sp,color: AppColors.whiteColor,fontWeight: FontWeight.w600), ),
          ),

          /* floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              child: Center(child: Text(pendingTaskController.pendingShipment.length.toString(),style: TextStyle(color: Colors.white),)),
              onPressed: (){

          }),*/


          backgroundColor: Colors.white,
          body: Column(
            children: [

/*
              Container(
                height: 85.h,
                width: MediaQuery.sizeOf(context).width,
                color: AppColors.primaryColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0.h),
                      child: Container(
                        height: 35.h,
                        width: MediaQuery.sizeOf(context).width * 0.93,
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                        child: Row(
                          children: [
                            20.w.sw,
                            Icon(Icons.search,
                                size: 22.sp,
                                color: Colors.black.withOpacity(0.7)),
                            Spacer(),
                        /*    Obx(
                                  () => Padding(
                                padding: EdgeInsets.only(right: 10.0.w),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: pendingTaskController.selectedFilterLabel.value,
                                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                                    dropdownColor: Colors.white,
                                    isDense: true,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 16.sp,
                                    ),
                                    items: pendingTaskController.filterMap.keys.map((label) {
                                      return DropdownMenuItem<String>(
                                        value: label,
                                        child: Text(label),
                                      );
                                    }).toList(),
                                    onChanged: (newLabel) async {
                                      pendingTaskController.selectedFilterLabel.value = newLabel!;
                                      if (pendingTaskController.selectedFilterValue == "custom") {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return DateRangeDialog(
                                              onCancel: () => Navigator.pop(context),
                                              onOk: (){
                                                pendingTaskController.pendingTask();
                                                Navigator.pop(context);
                                              },
                                            );
                                          },
                                        );
                                      } else {
                                        // Example: call API with backend value
                                        print("Send to API: ${pendingTaskController.selectedFilterValue}");
                                        await pendingTaskController.pendingTask();                                      }
                                    },
                                  ),
                                ),
                              ),
                            ),
*/
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

 */
/*
              Visibility(
                visible: pendingTaskController.pendingShipment
                    .any((item) => item.isSelected.value),
                child: Container(
                  decoration: BoxDecoration(
                    //color: AppColors.primaryColor
                      color: Colors.black
                  ),
                  height: 30.h,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){

                        setState(() {
                          for (var e in pendingTaskController.pendingShipment) {
                            e.isSelected.value = true;
                          }
                        });
                      }, child: Text("Select All ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                      10.w.sw,
                      TextButton(onPressed: (){
                        setState(() {
                          for (var e in pendingTaskController.pendingShipment) {
                            e.isSelected.value = false;
                          }
                        });
                      }, child: Text("UnSelect All ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                      10.w.sw,
                    ],
                  ),
                ),
              ),
*/

              6.h.sh,
              Expanded(child: pendingCard()),
            //  5.h.sh,
              /*
              Visibility(
                visible: pendingTaskController.pendingShipment
                    .any((item) => item.isSelected.value),
                child: FillButton(width: 200.w,
                  height: 50.h,
                  onTap: () {  },
                  textStyle: TextStyle(color: Colors.white),
                  borderRadius: 10.r,
                  text: 'OFD',),
              ),

              pendingTaskController.pendingShipment
                  .any((item) => item.isSelected.value)?20.h.sh:SizedBox(),
*/

            ],

          ),
        ),
      ),
    );
  }
}


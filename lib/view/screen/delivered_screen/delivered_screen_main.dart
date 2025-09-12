
import 'package:dressfair_driver_app/controller/delivery_controller/delivery_controller.dart';
import 'package:dressfair_driver_app/controller/odf_controller/ofd_controller.dart';
import 'package:dressfair_driver_app/view/util/dialog/filter_dialog.dart';

import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class DeliveredScreenMain extends StatefulWidget {
  const DeliveredScreenMain({super.key});
  @override
  State<DeliveredScreenMain> createState() => _DeliveredScreenMainState();
}
class _DeliveredScreenMainState extends State<DeliveredScreenMain> {
  final DeliveryController deliveryController =
  Get.put(DeliveryController());
  final ScrollController _scrollController = ScrollController();
  OfdController ofdController=Get.put(OfdController());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      deliveryController.deliverShipment.clear();
      deliveryController.selectedFilterLabel.value="All Record";
      deliveryController.deliveredTask();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        deliveryController.loadMoreTask();
      }
    });
  }

  Widget pendingCard() {
    if (deliveryController.isLoading.value) {
      return Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor),
      );
    }

    if (deliveryController.deliverShipment.isEmpty) {
      return Center(
        child: Text(
          "No Data Found",
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
        ),
      );
    }

    return ListView.builder(
      controller: _scrollController,
      itemCount: deliveryController.deliverShipment.length + 1,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        if (index < deliveryController.deliverShipment.length) {
          var item = deliveryController.deliverShipment[index];
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
                      Get.toNamed(detailDeliveredScreen, arguments: item);
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
                        Container(height: 30.h,
                          width: 58.w,
                          decoration: BoxDecoration(
                            color:(item.courierVoucherId ?? 0) > 1? Colors.green:Colors.red,
                            borderRadius: BorderRadius.circular(3.r),
                          ),
                          child:  Center(child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 3.0.w,vertical: 2.h),
                            child: Text((item.courierVoucherId ?? 0) > 1 ? "Paid" : "UnPaid",style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),),
                          )),
                        ),

                        10.w.sw,


                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          // Bottom loader
          return deliveryController.isMoreLoading.value
              ? Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: CircularProgressIndicator(
                    color: AppColors.primaryColor)),
          )
              : SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => OrangeStatusBar(
        child: Scaffold(
         floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              child: Center(child: Text(deliveryController.deliverShipment.length.toString(),style: TextStyle(color: Colors.white),)),
              onPressed: (){

          }),
          backgroundColor: Colors.white,
          body: Column(
            children: [
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
                            Obx(
                                  () => Padding(
                                padding: EdgeInsets.only(right: 10.0.w),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: deliveryController.selectedFilterLabel.value,
                                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                                    dropdownColor: Colors.white,
                                    isDense: true,
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 16.sp,
                                    ),
                                    items: deliveryController.filterMap.keys.map((label) {
                                      return DropdownMenuItem<String>(
                                        value: label,
                                        child: Text(label),
                                      );
                                    }).toList(),
                                    onChanged: (newLabel) async {
                                      deliveryController.selectedFilterLabel.value = newLabel!;
                                      if (deliveryController.selectedFilterValue == "custom") {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return DateRangeDialog(
                                              onCancel: () => Navigator.pop(context),
                                              onOk: (){
                                                deliveryController.deliveredTask();
                                            Navigator.pop(context);
                                              },
                                            );
                                          },
                                        );
                                      } else {
                                        // Example: call API with backend value
                                          print("Send to API: ${deliveryController.selectedFilterValue}");
                                          await deliveryController.deliveredTask();                                      }
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

             Visibility(
                visible: deliveryController.deliverShipment
                    .any((item) => item.isSelected.value),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor

                  ),
                  height: 35.h,
                  width: MediaQuery.sizeOf(context).width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(onPressed: (){

                        setState(() {
                          for (var e in deliveryController.deliverShipment) {
                            e.isSelected.value = true;
                          }
                        });
                      }, child: Text("Select All ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                      10.w.sw,
                      TextButton(onPressed: (){
                        setState(() {
                          for (var e in deliveryController.deliverShipment) {
                            e.isSelected.value = false;
                          }
                        });
                      }, child: Text("UnSelect All ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)),
                      10.w.sw,
                    ],
                  ),
                ),
              ),
              6.h.sh,
      Expanded(child: pendingCard()),
              5.h.sh,
              Visibility(
                visible: deliveryController.deliverShipment
                    .any((item) => item.isSelected.value),
                child: GestureDetector(
                  onTap: () async {
                    final selectedIds = deliveryController.deliverShipment
                        .where((item) => item.isSelected.value)
                        .map((item) => item.spAwbNumber)
                        .whereType<String>()
                        .toList();
                    print("Selected AWB Numbers: $selectedIds");
                   await   ofdController.confirmOfd(ofdConfirmIds: selectedIds);
                  },
                  child: Container(
                    height: 50.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10.r)
                    ),
                    child: ofdController.isLoading.value?Center(child: Padding(
                      padding:EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.0.h),
                      child: CircularProgressIndicator(color: Colors.white,),
                    )): Center(
                        child: Text(
                          "OFD",
                         style: TextStyle(color: Colors.white),
                        )),

                  ),
                ),
              ),

              deliveryController.deliverShipment
                  .any((item) => item.isSelected.value)?20.h.sh:SizedBox(),
            ],

          ),
        ),
      ),
    );
  }
}


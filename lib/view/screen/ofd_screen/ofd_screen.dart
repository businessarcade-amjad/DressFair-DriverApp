import 'dart:developer';

import 'package:dressfair_driver_app/controller/odf_controller/ofd_controller.dart';
import 'package:dressfair_driver_app/controller/simple_method/location_service.dart';
import 'package:dressfair_driver_app/view/util/dialog/more_button_dialog.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class OfdScreenMain extends StatefulWidget {
  const OfdScreenMain({super.key});

  @override
  State<OfdScreenMain> createState() => _OfdScreenMainState();
}

class _OfdScreenMainState extends State<OfdScreenMain> {
  final OfdController ofdController = Get.put(OfdController());
  final LocationService locationController = Get.find<LocationService>();

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ofdController.allOfd.clear();
      ofdController.showAllOfd();
    });
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
            left: 8.0.w,
            right: 8.0.w,
            bottom: 10.h,
            top: 2.h,
          ),
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: Offset(2, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    log("Location == ${item.deliveryLat},${item.deliveryLng}");
                    Get.toNamed(detailOfdScreen, arguments: item);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      10.h.sh,
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,

                        child: Row(
                          children: [
                            10.w.sw,
                            Text(
                              "Order No: ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                            Text(
                              item.spAwbNumber,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      2.h.sh,
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.9,

                        child: Row(
                          children: [
                            10.w.sw,
                            Text("Mobile: ", style: TextStyle(fontSize: 14.sp)),
                            Text(
                              item.toMobile,
                              style: TextStyle(fontSize: 14.sp),
                            ),

                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.3,
                            ),

                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return MoreButtons(
                                      no: () {},
                                      yes: () {},
                                      deliveryLat:
                                          double.tryParse(item.deliveryLat) ??
                                          0.0,
                                      deliveryLng:
                                          double.tryParse(item.deliveryLng) ??
                                          0.0,
                                    );
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
                      2.h.sh,
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.73,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.w.sw,
                            Text(
                              "Address: ",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                            Expanded(
                              child: Text(
                                "${item.cityArea?.name ?? ""} ${item.toAddress}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Visibility(
                        visible:
                            (item.distanceKm != null &&
                            item.distanceKm != double.infinity),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16.sp,
                                color: Colors.red,
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                locationController.formatDistance(
                                  item.distanceKm ?? 0.0,
                                ),
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      5.h.sh,
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
            title: Text(
              "Out For Delivery",
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              6.h.sh,
              Expanded(child: pendingCard()),
            ],
          ),
        ),
      ),
    );
  }
}

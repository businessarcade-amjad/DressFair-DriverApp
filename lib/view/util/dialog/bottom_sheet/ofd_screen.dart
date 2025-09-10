import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:get/get.dart';

class OfdReasonBottomSheet extends StatelessWidget {
  String productID;
   OfdReasonBottomSheet({super.key,required this.productID});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.4, // 40% of screen

      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50.w,
              height: 5.h,
              margin:  EdgeInsets.only(bottom: 16.h),
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.call_end, color: Colors.red),
              title: const Text("Not Responding"),
              onTap: () {
                Get.back();
                Get.toNamed(remarkScreen,arguments: {"productID": productID,
                  "statusCode": "2",
                });

              },
            ),
            ListTile(
              leading: const Icon(Icons.location_off, color: Colors.blue),
              title: const Text("Wrong Address"),
              onTap: () {
                Get.back();
                Get.toNamed(remarkScreen,arguments: {"productID": productID,
                  "statusCode": "3",
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.schedule, color: Colors.orange),
              title: const Text("Future Delivery"),
              onTap:(){
                Get.back();
                Get.toNamed(remarkScreen,arguments: {"productID": productID,
                  "statusCode": "4",
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

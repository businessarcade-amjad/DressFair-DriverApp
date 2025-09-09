import 'package:dressfair_driver_app/controller/scan_barcode_controller/scan_barcode_controller.dart';
import 'package:dressfair_driver_app/view/util/widgets/reuseable_buttons/reuseable_fill_button.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:dressfair_driver_app/view/util/widgets/shadows_reuse/AppShadows.dart';

class AllProductPickScreen extends StatefulWidget {
  const AllProductPickScreen({super.key});

  @override
  State<AllProductPickScreen> createState() => _AllProductPickScreenState();
}

class _AllProductPickScreenState extends State<AllProductPickScreen> {

  ScanBarcodeController allProductPickController=Get.put(ScanBarcodeController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: AppColors.primaryColor,
        centerTitle: false,
        title: Text("All Picked Shipment" ,style: TextStyle(color: Colors.white,fontSize: 18.sp,fontWeight: FontWeight.w600),),
        actions: [
          Obx(
          ()=> Padding(
              padding:  EdgeInsets.only(right: 8.0.w),
              child: Container(
                height: 30.h,width: 40.w,
              decoration: BoxDecoration(
                  color:Colors.black,
                  borderRadius: BorderRadius.circular(4.r)),
                child: Center(child: Text(allProductPickController.allProductPick.length  .toString(),style: TextStyle(color: Colors.white),)),

              ),

            ),
          )
        ],
      ),

      body: Obx(
          ()=>
         Column(
          children: [
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemCount: allProductPickController.allProductPick.length,
                  itemBuilder:(context,index){
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.0.h),
                  child: Container(
                    decoration: BoxDecoration( color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                     boxShadow: AppShadows.soft

                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 8.0.w,vertical: 8.0.h),
                      child: Column(
                        children: [
                          Text("Product : ${index}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600),)
                       ,10.h.sh
                         , Text("Product  ID: ${allProductPickController.allProductPick[index]}",style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: Colors.green),)
                        ],
                      ),
                    ),
                  ),
            );

          }),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FillButton(


                    width: 150.w, height: 50.h, onTap: (){

                      Get.offNamed(mainPickupScreen);
                }, textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ), borderRadius: 4.r, text:"Scan More"),
                10.w.sw,
                FillButton(
containerColor: Colors.green,

                    width: 150.w, height: 50.h, onTap: (){

  Get.offNamed(pendingScreenMain);
                },
                    textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ), borderRadius: 4.r,
                    text:"Confirm PickUp"),
              ],
            ),

            20.h.sh,

          ],
        ),
      ),


    );
  }
}

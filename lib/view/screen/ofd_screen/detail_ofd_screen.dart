import 'dart:developer';
import 'dart:ffi';

import 'package:dressfair_driver_app/controller/simple_method/simple_methode.dart';
import 'package:dressfair_driver_app/controller/user_location_controller/user_location_controller.dart';
import 'package:dressfair_driver_app/model/showofd_model/showofd_model.dart';
import 'package:dressfair_driver_app/view/util/dialog/bottom_sheet/ofd_screen.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class DetailOfdScreen extends StatefulWidget {
  final ShowOfdsModel ofd;
  const DetailOfdScreen({super.key,required this.ofd});

  @override
  State<DetailOfdScreen> createState() => _DetailOfdScreenState();
}

class _DetailOfdScreenState extends State<DetailOfdScreen> {
  UserLocationController userLocationController=Get.put(UserLocationController());
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("${widget.ofd.amount} ${widget.ofd.currency?.code??"" }" ,style: TextStyle(color: AppColors.whiteColor,fontSize: 16.sp),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.h.sh,
            Text("Order Details",style: TextStyle(fontWeight:FontWeight.w500),),
            10.h.sh,
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
                  Text("esk dxb",style: TextStyle(fontWeight:FontWeight.w500),),
                  30.w.sw,
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
            30.h.sh,

            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    5.w.sw,
                    GestureDetector(
                      onTap: (){
                        SimpleMethode.openPhone("+923309189520");
                      },
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppImages.callIcon))
                        ),
                      ),
                    ),
                    5.w.sw,
                    GestureDetector(

                        onTap: (){
                          SimpleMethode.openPhone("+923309189520");
                        },
                        child: Text("CALL")),
                    13.w.sw,
                    GestureDetector(
                      onTap: () async {
                        await SimpleMethode().openWhatsApp("03095953304");
                      },
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppImages.whatsappIcon))
                        ),
                      ),
                    ),
                    5.w.sw,
                    GestureDetector(
                        onTap: () async {
                          await SimpleMethode().openWhatsApp("03095953304");
                        },
                        child: Text("Whats App")),
                    14.w.sw,
                    GestureDetector(
                      onTap: () async {

                        final controller = Get.find<UserLocationController>();

                        log("Location ==${widget.ofd.deliveryLat}");
                        log("Location ==${widget.ofd.deliveryLng}");
                        if(widget.ofd.deliveryLat.isEmpty||widget.ofd.deliveryLng.isEmpty){
                          AppToast.showInfo("Delivery Address is Wrong");
                        }else{


                          await controller.getCurrentLocation(); // first get location
                          await controller.openGoogleMap(double.tryParse(widget.ofd.deliveryLat) ?? 0.0,double.tryParse(widget.ofd.deliveryLng) ?? 0.0);


                        }

                      },
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(AppImages.locationIcon))
                        ),
                      ),
                    ),
                    5.w.sw,
                    Text("Location"),
                    5.w.sw,
                  ],
                ),
              ),
            ),
            30.h.sh,
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  Container(height: 50.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(0.r)
                    ),
                    child: Center(child: Text("Deliver",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),)),
                  ),
                  10.w.sw,
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(
                          context: context, builder: (BuildContext context) {
                         return  OfdReasonBottomSheet(productID: widget.ofd.spAwbNumber);
                      });
                    },
                    child: Container(height: 50.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(0.r)
                      ),
                      child: Center(child: Text("Update Status",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                      ),)),
                    ),
                  )
                ],
              ),
            ),
            15.h.sh,
          ],
        ),
      ),
    );
  }
}

import 'package:dressfair_driver_app/model/pending_task/pending_task.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';
import 'package:dressfair_driver_app/view/util/widgets/shadows_reuse/AppShadows.dart';

class DetailPendingScreen extends StatefulWidget {
  final PendingShipment shipment;
  const DetailPendingScreen({super.key,required this.shipment});

  @override
  State<DetailPendingScreen> createState() => _DetailPendingScreenState();
}

class _DetailPendingScreenState extends State<DetailPendingScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("Total 69.00 AED",style: TextStyle(color: AppColors.whiteColor,fontSize: 16.sp),),
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
              Text("Order No:  ${widget.shipment.spAwbNumber}",style: TextStyle(fontWeight:FontWeight.w500),),
              Container(
                height: 30.h,
                width: 140.w,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.primaryColor)
                ),
                child: Center(child: Text("${widget.shipment.paymentMethod.name}")),
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
                  Text("Mobile No:",style:TextStyle(fontWeight:FontWeight.w400),),
                  Text("${widget.shipment.to_mobile}",style:TextStyle(fontWeight:FontWeight.w500),),
                ],
              ),
            ),
            30.w.sw,
            Container(
              width: MediaQuery.sizeOf(context).width*0.93,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Address: ",style: TextStyle(fontWeight:FontWeight.w400),),
                  Container(

                      width: MediaQuery.sizeOf(context).width*0.7,
                      child: Text("${widget.shipment.toAddress} ${widget.shipment.cityArea.name} ${widget.shipment.city.name}",overflow:TextOverflow.ellipsis,style: TextStyle(fontWeight:FontWeight.w400),maxLines: 2,softWrap: true,)),


                ],
              ),
            ),
            30.h.sh,
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height*0.25,
              decoration: BoxDecoration(
                color: Colors.white,
boxShadow: AppShadows.softBottom,
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Row(

                children: [

                Container(
                  height: 110.h,
                  width: 110.w,

                  decoration: BoxDecoration(
                      //color: Colors.red,
                    image: DecorationImage(image: AssetImage("assets/images/pending/pending_detail_images/place_holder.jpg"))
                  ),
                ),
                  Container(
                    //color: Colors.red,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.h.sh,
                        Text("Zipper Closure Solid Color",),
                        Container(

                            width: MediaQuery.sizeOf(context).width*0.6,
                            child: Text("Breathable Shoes for Ladies - Light Green",maxLines: 2,softWrap: true,overflow: TextOverflow.ellipsis,)),
                        Container(
                            width: MediaQuery.sizeOf(context).width*0.6,
                            child: Text("Quantity 1  Price: 54.00 AED",maxLines: 2,softWrap: true,overflow: TextOverflow.ellipsis,)),
                        Text("Total 54.00 AED",softWrap:true,style: TextStyle(color: Colors.red),),
                        Container(
                            width: MediaQuery.sizeOf(context).width*0.6,
                            child: Text("Color: Light Green Size: 37",maxLines: 2,softWrap: true,overflow: TextOverflow.ellipsis,)),
                        
                        
                        

                      ],
                    ),
                  )

                ],
              ),
            ),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  5.w.sw,
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(AppImages.callIcon))
                    ),
                  ),
                  5.w.sw,
                  Text("CALL"),
                  10.w.sw,
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.whatsappIcon))
                    ),
                  ),
                  5.w.sw,
                  Text("Whats App"),
                  10.w.sw,
                  Container(
                    height: 35.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.locationIcon))
                    ),
                  ),
                  5.w.sw,
                  Text("Location"),
                  5.w.sw,
                ],
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
                  Container(height: 50.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(0.r)
                    ),
                    child: Center(child: Text("Return",style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),)),
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

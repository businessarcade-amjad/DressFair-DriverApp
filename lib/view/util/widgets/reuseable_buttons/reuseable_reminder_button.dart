// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
//
// import '../../constants/app_colors/appcolors.dart';
//
// class ReminderButton extends StatelessWidget {
//   double height;
//   double width;
//   double borderRadius;
//   VoidCallback onTap;
//   TextStyle textStyle;
//   Color containerColor;
//   String text;
//   String iconImage;
//
//   ReminderButton(
//       {super.key,
//       required this.width,
//       required this.iconImage,
//       required this.height,
//       required this.containerColor,
//       required this.onTap,
//       required this.textStyle,
//       required this.borderRadius,
//       required this.text});
//   // AddNewTaskController addNewTaskController = Get.put(AddNewTaskController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: height,
//           width: width,
//           decoration: BoxDecoration(
//               color: containerColor,
//               border: Border.all(color: AppColors.primaryColor, width: 2.w),
//               borderRadius: BorderRadius.circular(borderRadius)),
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.0.w),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 SvgPicture.asset(iconImage),
//                 SizedBox(
//                   width: 10.w,
//                 ),
//                 Center(
//                     child: Text(
//                   text,
//                   style: textStyle,
//                 )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

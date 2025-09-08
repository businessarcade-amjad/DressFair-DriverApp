// import 'dart:developer';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
//
// import '../../constants/app_colors/appcolors.dart';
//
// class SearchTextField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final Color textColor;
//   final TextStyle textStyle;
//   final TextInputType keyboardType;
//   final double width;
//   SearchTextField({
//     super.key,
//     required this.hintText,
//     required this.controller,
//     required this.textColor,
//     required this.textStyle,
//     this.keyboardType = TextInputType.text,
//     this.width = double.infinity,
//   });
//
//   final myFocusNode = FocusNode();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 50.h,
//         width: 360.w,
//         decoration: BoxDecoration(
//             color: AppColors.whiteColor,
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(0.3, 0.3),
//               ),
//               BoxShadow(
//                 color: Colors.white,
//                 offset: Offset(-0.3, -0.3),
//               )
//             ],
//             borderRadius: BorderRadius.circular(10.r)),
//         child: Center(
//           child: Obx(
//             () => TextField(
//               focusNode: myFocusNode,
//               autofocus: false,
//               //   controller: mapGetXController.searchController.value,
//               onChanged: (value) {},
//               // {
//               //   log("Search IS = = 000");
//               //   if (mapGetXController.searchController.value.text.isEmpty) {
//               //     mapGetXController.isSearchedEmpty.value = false;
//               //   } else {
//               //     dbAllMethodController.searchTasks(value);
//               //     log("Saech 111");
//               //     mapGetXController.isSearchedEmpty.value = true;
//               //   }
//               // },
//               onSubmitted: (value) {
//                 //  dbAllMethodController.searchTasks(value);
//               },
//               cursorColor: AppColors.primaryColor,
//
//               decoration: InputDecoration(
//                 hintText: hintText,
//                 filled: true,
//                 fillColor: AppColors.searchbarColor.withOpacity(0.16),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0.r), // Rounded border
//                   borderSide: BorderSide.none, // No border
//                 ),
//                 contentPadding:
//                     EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 16.h),
//                 suffixIcon: Padding(
//                     padding: EdgeInsets.all(12.0.w),
//                     child: GestureDetector(
//                         onTap: () {},
//                         // {
//                         //   if (mapGetXController
//                         //       .searchController.value.text.isEmpty) {
//                         //   } else {
//                         //     if (dbAllMethodController.filteredTasks.isEmpty) {
//                         //       FocusScope.of(context).unfocus();
//                         //       mapGetXController.searchController.value.clear();
//                         //       mapGetXController.isSearchedEmpty.value = false;
//                         //       showTaskFoundToast(context, "No Tasks Found");
//                         //     } else {
//                         //       FocusScope.of(context).unfocus();
//                         //     }
//                         //   }
//                         // },
//                         child: SvgPicture.asset("assets/search.svg"))),
//               ),
//               style: TextStyle(color: textColor), // Text color
//             ),
//           ),
//         ));
//   }
// }

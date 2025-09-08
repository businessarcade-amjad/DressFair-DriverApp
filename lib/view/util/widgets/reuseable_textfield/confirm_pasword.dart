// import 'dart:developer';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../../constants/app_colors/appcolors.dart';
// import '../routes/screens_library.dart';
//
// class ConfirmPasswordTextField extends StatefulWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final Color textColor;
//   final TextStyle textStyle;
//   final TextInputType keyboardTypea double width;
//   final double height;
//
// //  SignUpController signUpController = Get.put(SignUpController());
//   ConfirmPasswordTextField({
//     super.key,
//     required this.hintText,
//     required this.controller,
//     required this.textColor,
//     required this.textStyle,
//     required this.height,
//     // required this.formKey,
//     this.keyboardType = TextInputType.text,
//     this.width = double.infinity, // Default value is set to take full width
//   });
//
//   @override
//   State<ConfirmPasswordTextField> createState() =>
//       _ConfirmPasswordTextFieldState();
// }
//
// class _ConfirmPasswordTextFieldState extends State<ConfirmPasswordTextField> {
//   // SignUpController signUpController = Get.put(SignUpController());
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: widget.width,
//       height: widget.height.h,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.r),
//           color: AppColors.primaryColorLight),
//       child: TextFormField(
//         controller: widget.controller,
//         cursorColor: AppColors.primaryColor,
//         keyboardType: widget.keyboardType,
//         // obscureText: signUpController.isHideConfirmPassword.value,
//         style: widget.textStyle.copyWith(
//             fontSize: 16.sp, color: widget.textColor.withOpacity(0.8)),
//         decoration: InputDecoration(
//           suffixIcon: Padding(
//             padding: EdgeInsets.only(right: 12.0.w),
//             child: GestureDetector(
//                 onTap: () {
//                   // setState(() {
//                   //   signUpController.isHideConfirmPassword.value =
//                   //       !signUpController.isHideConfirmPassword.value;
//                   //   log("IsPassword Hide = ${signUpController.isHideConfirmPassword.value}");
//                   // });
//                   log("aaa");
//                 },
//                 child: Icon(
//                     // signUpController.isHideConfirmPassword.value
//                     // ? Icons.remove_red_eye
//                     // :
//                     Icons.visibility_off)),
//           ),
//           border: InputBorder.none,
//           contentPadding:
//               EdgeInsets.only(left: 10.w, right: 10.w, top: 11.h, bottom: 0),
//           hintText: widget.hintText,
//           hintStyle: widget.textStyle.copyWith(
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp,
//               color: widget.textColor.withOpacity(0.4)),
//         ),
//       ),
//     );
//   }
// }

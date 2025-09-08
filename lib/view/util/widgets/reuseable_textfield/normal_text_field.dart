// import '../routes/screens_library.dart';
//
// class NormalTextField extends StatelessWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final Color textColor;
//   final TextStyle textStyle;
//   final TextInputType keyboardType;
//   final double width;
//   final double height;
//   bool? isPassword = false;
//   bool? isConfirmPassword = false;
//
//   NormalTextField(
//       {super.key,
//       required this.hintText,
//       required this.controller,
//       required this.textColor,
//       required this.height,
//       required this.textStyle,
//       this.keyboardType = TextInputType.text,
//       this.width = double.infinity,
//       this.isPassword,
//       this.isConfirmPassword // Default value is set to take full width
//       });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: height.h,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.r),
//           color: AppColors.primaryColorLight),
//       child: TextFormField(
//         controller: controller,
//         cursorColor: AppColors.primaryColor,
//         keyboardType: keyboardType,
//         style: textStyle.copyWith(
//             fontSize: 16.sp,
//             color: textColor.withOpacity(
//               0.8,
//             )),
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           contentPadding:
//               EdgeInsets.only(left: 10.w, right: 0, top: 0, bottom: 0),
//           hintText: hintText,
//           hintStyle: textStyle.copyWith(
//               fontWeight: FontWeight.w500,
//               fontSize: 14.sp,
//               color: textColor.withOpacity(0.4)),
//         ),
//       ),
//     );
//   }
// }

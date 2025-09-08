// import 'dart:developer';
//
// import '../routes/screens_library.dart';
//
//
//
// class PasswordTextField extends StatefulWidget {
//   final String hintText;
//   final TextEditingController controller;
//   final Color textColor;
//   final TextStyle textStyle;
//   final TextInputType keyboardType;
//   final double width;
//   final double height;
//
//   // SignUpController signUpController = Get.put(SignUpController());
//   PasswordTextField({
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
//   State<PasswordTextField> createState() => _PasswordTextFieldState();
// }
//
// class _PasswordTextFieldState extends State<PasswordTextField> {
//   //SignUpController signUpController = Get.put(SignUpController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       alignment: Alignment.center,
//       width: widget.width,
//       height: widget.height,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10.r),
//           color: AppColors.primaryColorLight
//           //    color: Colors.grey
//           ),
//       child: TextFormField(
//         controller: widget.controller,
//         cursorColor: AppColors.primaryColor,
//         keyboardType: widget.keyboardType,
//        // obscureText: signUpController.isHidePassword.value,
//         style: widget.textStyle.copyWith(
//           fontSize: 16.sp,
//           color: widget.textColor.withOpacity(0.8),
//         ),
//         decoration: InputDecoration(
//           suffixIcon: Padding(
//             padding: EdgeInsets.only(right: 12.0.w),
//             child: GestureDetector(
//                 onTap: () {
//                   // setState(() {
//                   //   signUpController.isHidePassword.value =
//                   //       !signUpController.isHidePassword.value;
//                   //   log("IsPassword Hide = ${signUpController.isHidePassword.value}");
//                   // });
//                   log("aaa");
//                 },
//                 child: Icon(
//                     // signUpController.isHidePassword.value
//                     // ? Icons.remove_red_eye
//                     // :
//                     Icons.visibility_off)),
//           ),
//           border: InputBorder.none,
//           // suffix: const Padding(
//           //   padding: EdgeInsets.only(left: 20.0, right: 8),
//           //   child: Icon(Icons.remove_red_eye),
//           // ),
//           contentPadding:
//               EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 0),
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

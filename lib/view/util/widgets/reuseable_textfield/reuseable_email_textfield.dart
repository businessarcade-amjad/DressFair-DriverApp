// import 'package:flutter/services.dart';
// import 'package:health_book/controller/auth_controller/login_controller.dart';
// import 'package:health_book/controller/auth_controller/signup_controller.dart';
// import 'package:health_book/view/utlis/widgets/routes/screens_library.dart';
//
// class CustomTextField extends StatefulWidget {
//   final TextEditingController controller;
//   final String name;
//   final String hintName;
//   final IconData? suffixIcon;
//   final bool obscureText;
//   final TextCapitalization textCapitalization;
//   final TextInputType inputType;
//   final TextInputFormatter? inputFormatter;
//   final FormFieldValidator validator;
//   final String? passwordValue;
//   final Function? onChanged;
//   bool isPasswordFiled = false;
//
//   CustomTextField(
//       {Key,
//       required this.controller,
//       required this.name,
//       this.suffixIcon,
//       required this.obscureText,
//       this.textCapitalization = TextCapitalization.none,
//       required this.inputType,
//       this.inputFormatter,
//       required this.validator,
//       this.passwordValue,
//       this.onChanged,
//       required this.hintName,
//       required this.isPasswordFiled});
//
//   @override
//   State<CustomTextField> createState() => _CustomTextFieldState();
// }
//
// class _CustomTextFieldState extends State<CustomTextField> {
//   LoginController loginController = Get.put(LoginController());
//   SignupController signupController = Get.put(SignupController());
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       style: TextStyle(fontSize: 14.sp, color: Colors.black.withOpacity(0.8)),
//       controller: widget.controller,
//       keyboardType: widget.inputType,
//       obscureText: !widget.isPasswordFiled
//           ? widget.obscureText
//           : !loginController.isObSecure.value
//               ? true
//               : false,
//       cursorColor: AppColors.primaryColor,
//       autofocus: false,
//       textAlign: TextAlign.start,
//       decoration: InputDecoration(
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5.0.r),
//         ),
//         hintText: widget.hintName,
//         //widget.name,
//         hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
//
//         // suffixIcon: widget.suffixIcon == null ? SizedBox() : Icon(Icons.add),
//
//         suffixIcon: widget.suffixIcon == null
//             ? null
//             //const SizedBox()
//             : !widget.isPasswordFiled
//                 ? Icon(
//                     widget.suffixIcon,
//                     color: AppColors.secondaryBright,
//                   )
//                 : loginController.isObSecure.value
//                     ? GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             loginController.isObSecure.value =
//                                 !loginController.isObSecure.value;
//                           });
//                         },
//                         child: const Icon(
//                           Icons.visibility_off_sharp,
//                           color: AppColors.secondaryBright,
//                         ))
//                     : GestureDetector(
//                         onTap: () {
//                           setState(() {
//                             loginController.isObSecure.value =
//                                 !loginController.isObSecure.value;
//                           });
//                         },
//                         child: const Icon(
//                           Icons.remove_red_eye,
//                           color: AppColors.secondaryBright,
//                         )),
//         contentPadding: EdgeInsets.fromLTRB(10.w, 12.h, 0.w, 12.h),
//         fillColor: Colors.transparent,
//         focusColor: Colors.grey,
//         focusedErrorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.all(Radius.circular(6.r)),
//             borderSide: BorderSide(width: 1.w, color: Colors.red)),
//         errorBorder: const OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.red),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5.0.r),
//           borderSide: BorderSide(width: 1.0.w, color: Colors.grey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(5.0.r),
//           borderSide: BorderSide(width: 1.0.w, color: Colors.grey),
//         ),
//         filled: true,
//       ),
//       validator: (value) {
//         bool hasUppercase = value!.contains(RegExp(r'[A-Z]'));
//         bool hasLowercase = value!.contains(RegExp(r'[a-z]'));
//         bool hasSpecialCharacter =
//             value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
//         if (value.isEmpty) {
//           return 'Empty ${widget.name}';
//         } else if (widget.name == 'Email' && value.length < 8) {
//           return 'not valid';
//         } else if (widget.name == 'Choose User ID' &&
//             (value.length <= 0 || value.length > 4)) {
//           return 'Enter 4 digit unique ID';
//         } else if (widget.name == 'Password' && value.length < 8) {
//           return 'Enter atleast 8 digits ${widget.name}';
//         } else if (widget.name == 'Password' && !hasUppercase) {
//           return ' At least one uppercase letter';
//         } else if (widget.name == 'Password' && !hasLowercase) {
//           return ' At least one lowercase letter';
//         }
//         if (widget.name == 'Password' && !hasSpecialCharacter) {
//           return 'At least one special character';
//         } else if (widget.name == 'Confirm Password' && value.length < 8) {
//           return 'Enter atleast 8 digits  ${widget.name}';
//         } else if (widget.name == 'Confirm Password' &&
//             !value.contains(
//                 signupController.signUpPassword.value.text.toString())) {
//           return 'Password and confirm password does not match';
//         } else if (widget.name == 'Email') {
//           final emailRegExp = RegExp(
//               r"^[a-zA-Z0-9.!#$%&'+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)$");
//
//           if (value!.length < 8) {
//             return 'Email must be at least 8 characters long.';
//           } else if (!emailRegExp.hasMatch(value)) {
//             return 'Please enter a valid email address.';
//           } else if (value.startsWith('.') || value.endsWith('.')) {
//             return 'Email cannot start or end with a period.';
//           } else if (value.contains('..')) {
//             return 'Email cannot contain consecutive periods.';
//           } else if (value.length - value.replaceAll(r'[^\.]', '').length > 1) {
//             return 'Email cannot have multiple consecutive dots.';
//           } else if (!value.contains('.')) {
//             return 'Email must contain at least one dot (.)';
//           }
//         }
//       },
//     );
//   }
// }

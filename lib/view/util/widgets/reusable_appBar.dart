import 'package:dressfair_driver_app/view/util/constant/app_colors/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget reuseAbleAppBar({
  required String title,
  bool showBack = false,
  List<Widget>? actions,
}) {
  return AppBar(
    automaticallyImplyLeading: showBack,
    centerTitle: true,
    backgroundColor: AppColors.primaryColor,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 17.0.sp,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    ),
    actions: actions,
  );
}

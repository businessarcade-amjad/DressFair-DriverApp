import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class LoadingDialogWidget extends StatelessWidget {
  final String message;

  const LoadingDialogWidget({
    Key? key,
    this.message = "Please wait...",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            SizedBox(width: 20.w),
            Text(
              message,
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ),
    );
  }
}

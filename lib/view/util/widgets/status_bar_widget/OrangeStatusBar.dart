import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class OrangeStatusBar extends StatelessWidget {
  final Widget child;

  const OrangeStatusBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
      ),
      child: child,
    );
  }
}

import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class AppShadows {
  static List<BoxShadow> soft = [
    BoxShadow(
      color: Colors.black.withOpacity(0.01),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(2, 4),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.01),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(4, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(-4, 2),
    ),
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(4, -2),
    ),
  ];
  static List<BoxShadow> softBottom = [

    BoxShadow(
      color: Colors.black.withOpacity(0.05), // shadow color
      spreadRadius: 1,
      blurRadius: 1,
      offset: Offset(0, 3),
    ),
  ];

}

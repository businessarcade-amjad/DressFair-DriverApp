import 'package:dressfair_driver_app/model/delivery_model/delivery_model.dart';
import 'package:dressfair_driver_app/model/pending_task/pending_task.dart';
import 'package:dressfair_driver_app/model/showofd_model/showofd_model.dart';
import 'package:dressfair_driver_app/view/screen/delivered_screen/delivered_screen_main.dart';
import 'package:dressfair_driver_app/view/screen/delivered_screen/detail_delivered_screen.dart';
import 'package:dressfair_driver_app/view/screen/ofd_screen/detail_ofd_screen.dart';
import 'package:dressfair_driver_app/view/screen/ofd_screen/ofd_screen.dart';
import 'package:dressfair_driver_app/view/screen/ofd_screen/remark_screen.dart';
import 'package:dressfair_driver_app/view/screen/pending_screen/detail_pending_screen.dart';
import 'package:dressfair_driver_app/view/screen/pending_screen/pending_screen_main.dart';
import 'package:dressfair_driver_app/view/screen/pick_up_screen/all_product_pick_screen.dart';
import 'package:dressfair_driver_app/view/screen/pick_up_screen/main_pickup_screen.dart';
import 'package:dressfair_driver_app/view/screen/returned/detail_returned_screen.dart';
import 'package:dressfair_driver_app/view/screen/returned/returned_screen_main.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

class MyRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case loginInScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
        case pendingScreenMain:
      return MaterialPageRoute(builder: (context) => const PendingScreenMain());
      case detailPendingScreen:
        final shipment = settings.arguments as PendingShipment;
      return MaterialPageRoute(builder: (context) => DetailPendingScreen(shipment: shipment));
      case detailDeliveredScreen:
        final shipment = settings.arguments as DeliveredModel;
      return MaterialPageRoute(builder: (context) => DetailDeliveredScreen(shipment: shipment));
      case detailOfdScreen:
        final ofd = settings.arguments as ShowOfdsModel;
      return MaterialPageRoute(builder: (context) => DetailOfdScreen(ofd: ofd));
      case detailReturnedScreen:
        return MaterialPageRoute(builder: (context) => const DetailReturnedScreen());
      case returnedScreenMain:
        return MaterialPageRoute(builder: (context) => const ReturnedScreenMain());
        case deliveredScreenMain:
        return MaterialPageRoute(builder: (context) => const DeliveredScreenMain());
        case mainPickupScreen:
        return MaterialPageRoute(builder: (context) => const MainPickupScreen());
        case allProductPickScreen:
        return MaterialPageRoute(builder: (context) => const AllProductPickScreen());
        case ofdScreenMain:
        return MaterialPageRoute(builder: (context) => const OfdScreenMain());
        case remarkScreen:
          final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(builder: (context) =>  RemarkScreen( productID: args["productID"],
          statusCode: args["statusCode"],));
    // case mainHomeScreen:
      //   return MaterialPageRoute(builder: (context) => const MainHomeScreen());
      // case chatScreen:
      //   return MaterialPageRoute(builder: (context) => const ChatScreen());
      // case mainChatScreen:
      // // var data = settings.arguments as bool;
      // // return MaterialPageRoute(builder: (context) => MainChatScreen());
      // case aiDoctor:
      //   return MaterialPageRoute(builder: (context) => const AiDoctor());
      // case mentalHealthScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const MentalHealthScreen());
      // // case signUp:
      //   return MaterialPageRoute(builder: (context) => SignUpScreen());
      // case login:
      //   return MaterialPageRoute(builder: (context) => const LoginScreen());
      // case aiDoctor:
      //   return MaterialPageRoute(builder: (context) => const AiDoctor());
      // case woundHello:
      //   return MaterialPageRoute(builder: (context) => const WoundCareHealth());
      // case woundName:
      //   return MaterialPageRoute(builder: (context) => const WoundName());
      // case woundGender:
      //   return MaterialPageRoute(builder: (context) => const WoundGender());
      // case woundAge:
      //   return MaterialPageRoute(builder: (context) => const WoundAge());
      // case woundUserType:
      //   return MaterialPageRoute(builder: (context) => const WoundUserType());
      // case woundLocation:
      //   return MaterialPageRoute(builder: (context) => const WoundLocation());
      //
      // case originOFWound:
      //   return MaterialPageRoute(builder: (context) => const OriginOFWound());
      //
      // case woundAppearance:
      //   return MaterialPageRoute(builder: (context) => const WoundAppearance());
      // case sizeOfWound:
      //   return MaterialPageRoute(builder: (context) => const SizeOfWound());
      // case depthOfWound:
      //   return MaterialPageRoute(builder: (context) => const DepthOFWound());
      // case woundColor:
      //   return MaterialPageRoute(builder: (context) => const WoundColor());
      // case historyOfWound:
      //   return MaterialPageRoute(builder: (context) => const HistoryOfWound());
      // case greatAnalyzing:
      //   return MaterialPageRoute(builder: (context) => const GreatAnalyzing());
      // case finalResultShow:
      //   return MaterialPageRoute(builder: (context) => const FinalResultShow());
      // case mainAiDoctorChatScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const MainAiDoctorChatScreen());
      // case woundInformationScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const WoundInformationScreen());
      //
      // case moreDetailInformationScreen:
      //   var data = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (context) => MoreDetailInformationScreen(
      //             imagePath: data,
      //           ));

      // case ulcersInformationScreen:
      //   // var data = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (context) => UlcersInformationScreen(
      //           //       imagePath: data,
      //           ));
      //
      // case moreDetailUlcersInformation:
      //   var data = settings.arguments as String;
      //   return MaterialPageRoute(
      //       builder: (context) => MoreDetailUlcersInformation(imagePath: data));

      //  case editRepeatedTask:
      //    var data = settings.arguments as bool;
      //    // return MaterialPageRoute(
      //    //     builder: (context) => EditRepeatedTask(
      //    //           isFromYoursScreen: data,
      //    //         ));
      default:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
    }
  }
}

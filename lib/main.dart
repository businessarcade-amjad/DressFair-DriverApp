import 'package:dressfair_driver_app/view/util/widgets/routes/myroutes.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

import 'controller/simple_method/location_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  final locationService = Get.put(LocationService());
  await locationService.startTracking();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    //DevicePreview(
    // enabled: true,
    //  builder: (context) => MyApp(),
    // ),
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 752),
      // designSize: const Size(411, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // useInheritedMediaQuery: true,
          //  builder: DevicePreview.appBuilder,
          //  locale: DevicePreview.locale(context),
          debugShowCheckedModeBanner: false,
          title: AppText.appName,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          onGenerateRoute: MyRoutes.generateRoute,
          initialRoute: splashScreen,
        );
      },
    );
  }
}

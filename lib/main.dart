import 'package:device_preview/device_preview.dart';
import 'package:dressfair_driver_app/view/util/shared_prefrences/user_prefrences.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/myroutes.dart';
import 'package:dressfair_driver_app/view/util/widgets/routes/screens_library.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //await ScreenUtil.ensureScreenSize();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await UserPreferences.init();

  runApp(
      //DevicePreview(
       // enabled: true,
      //  builder: (context) => MyApp(),
     // ),
      MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

 return   ScreenUtilInit(
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
        });
  }
}



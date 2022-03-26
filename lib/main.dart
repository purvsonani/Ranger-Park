import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ranger_park/core/utils/app_theme.dart';
import 'package:ranger_park/presentations/home_screen/home_screen.dart';
import 'package:ranger_park/presentations/splash_screen/splash_screen.dart';
import 'package:ranger_park/presentations/welcome_screen/welcome_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(1080, 1920),
        builder: () {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: appTheme,
            home: SplashScreen(),
          );
        });
  }
}

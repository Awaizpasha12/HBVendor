import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:happybash/screens/splash_screen.dart';
import 'package:happybash/utility/app_bindings.dart';
import 'package:happybash/utility/colors.dart';

import 'controllers/translation_controller.dart';
final GetStorage getPreference = GetStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // runApp(DevicePreview(builder:  (BuildContext context)=>const MyApp()));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context,child) =>GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: Messages(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('es', 'ES'),
        initialBinding: AppBinding(),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
          useMaterial3: false,
          appBarTheme: const AppBarTheme(
            backgroundColor: colorFFFFFF,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}



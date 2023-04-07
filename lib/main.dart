import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:misafu/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:misafu/src/features/authentication/screens/splash_screen/splash_screen_animation.dart';
import 'package:misafu/src/utils/theme/theme.dart';

void main() {
  runApp(
      // const MyApp()
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'MISAFU',
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: SplashScreenAnimation(),
    );
  }
}


import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/firebase_options.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
import 'package:msa/src/utils/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
// void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  await Get.putAsync(() => SharedPreferences.getInstance());
  runApp(const MyApp()
      // DevicePreview(
      //   enabled: !kReleaseMode,
      //   builder: (context) => const MyApp(), // Wrap your app
      // ),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRight,
      transitionDuration: const Duration(milliseconds: 500),
      title: 'MSA',
      theme: CAppTheme.lightTheme,
      darkTheme: CAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Scaffold(
        // backgroundColor: Theme.of(context).splashColor,
        body: Center(
            child: CircularProgressIndicator(
          color: cSkyBlue,
        )),
      ),
    );
  }
}

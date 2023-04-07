import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:misafu/main.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/sizes.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:page_transition/page_transition.dart';

import '../home_screen/admin/admin_home.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
          splash: Lottie.asset(cLoadingLineJson),
          backgroundColor: Theme.of(context).splashColor,
          nextScreen: MyHomePage(title: cHome.toUpperCase(),),
          duration: 1800,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.leftToRight,
          // animationDuration: const Duration(milliseconds: 180),
          splashIconSize: 240,
        ),
    );
  }
}

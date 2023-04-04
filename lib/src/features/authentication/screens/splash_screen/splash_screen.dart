import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:misafu/main.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/image_strings.dart';
import 'package:misafu/src/constants/sizes.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSplashScreen(
          splash: Lottie.asset('assets/json/welcome.json'),

          // Column(
          //   children: [
          //     Text(cAppName, style: Theme.of(context).textTheme.headlineSmall,),
          //     Text(cAppNameDetailed, style: Theme.of(context).textTheme.titleLarge,),
          //     Image.asset('assets/images/research.png')
          //   ],
          // ),
          backgroundColor: Theme.of(context).splashColor,
          nextScreen: const MyHomePage(title: 'HOME',),
          // duration: 4000,
          // splashTransition: SplashTransition.sizeTransition,
          // pageTransitionType: PageTransitionType.leftToRightWithFade,
          // animationDuration: const Duration(seconds: 5),
          splashIconSize: 300,
        ),
      ),
    );
  }
}

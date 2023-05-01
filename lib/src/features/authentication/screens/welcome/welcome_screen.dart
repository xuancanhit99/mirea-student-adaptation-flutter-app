import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:msa/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/screens/login/student/student_login_screen.dart';

import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? cDarkColor : cWhiteColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          CFadeInAnimation(
            durationInMs: 1600,
            animate: CAnimatePosition(
              topAfter: -30,
              topBefore: -80,
              leftAfter: -30,
              leftBefore: -80,
            ),
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(220),
                  color: cLogoMireaColor),
            ),
          ),
          CFadeInAnimation(
            durationInMs: 2500,
            animate: CAnimatePosition(
              bottomAfter: 60,
              bottomBefore: 30,
              rightAfter: 30,
              rightBefore: 30,
            ),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: cLogoMireaColor,
              ),
            ),
          ),
          CFadeInAnimation(
            durationInMs: 1200,
            animate: CAnimatePosition(
              bottomAfter: 0,
              bottomBefore: -100,
              leftAfter: 0,
              leftBefore: 0,
              rightAfter: 0,
              rightBefore: 0,
              topAfter: 0,
              topBefore: 0,
            ),
            child: Container(
              padding: const EdgeInsets.all(35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // const SizedBox(height: 40,),
                  Text(
                    cAppNameDetailed.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: cAppNameColor),
                  ),
                  Lottie.asset(cWelcomeJson),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () =>
                                  Get.offAll(() => const StudentLoginScreen()),
                              child: Text(cLogin.toUpperCase()))),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () =>
                                  Get.offAll(() => const SignUpScreen()),
                              child: Text(cRes.toUpperCase()))),
                    ],
                  ),
                  Text(
                    cCopyright,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

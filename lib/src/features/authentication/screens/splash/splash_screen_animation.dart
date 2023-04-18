import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:msa/main.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/sizes.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';

import '../../../../common_widgets/fade_in_animation/animation_design.dart';

class SplashScreenAnimation extends StatelessWidget {
  SplashScreenAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();

    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
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
                  borderRadius: BorderRadius.circular(200),
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
            durationInMs: 1600,
            animate: CAnimatePosition(topAfter: 130, topBefore: 130),
            child: Text(
              cAppNameDetailed.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: cAppNameColor),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
              // top: 280,
              height: 245,
              child: Lottie.asset(cWelcomeJson)),
          Positioned(
              bottom: 100, height: 245, child: Lottie.asset(cLoadingLineJson)),
          Positioned(
              bottom: 90,
              // left: cDefaultSize,
              child: Text(
                cCopyright,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}

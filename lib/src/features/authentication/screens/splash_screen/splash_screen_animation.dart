import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:misafu/main.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/sizes.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:misafu/src/features/authentication/controllers/splash_screen_animation_controller.dart';

import '../home/admin/admin_home.dart';

class SplashScreenAnimation extends StatelessWidget {
  SplashScreenAnimation({Key? key}) : super(key: key);

  final splashController = Get.put(SplashScreenAnimationController());

  @override
  Widget build(BuildContext context) {
    splashController.startAnimation();

    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 5000),
                top: splashController.animate.value ? 0 : -80,
                left: splashController.animate.value ? 0 : -80,
                child: Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: cLogoMireaColor),
                )),
          ),
          Obx(
            () => AnimatedPositioned(
                duration: const Duration(milliseconds: 2500),
                bottom: splashController.animate.value ? 60 : 30,
                right: 30,
                child: AnimatedOpacity(
                  opacity: splashController.animate.value ? 1 : 0,
                  duration: const Duration(milliseconds: 1500),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: cLogoMireaColor,
                    ),
                  ),
                )),
          ),
          Positioned(
              top: 100,
              // left: cDefaultSize,
              child: Obx(
                () => AnimatedOpacity(
                  duration: const Duration(milliseconds: 1500),
                  opacity: splashController.animate.value ? 1 : 0,
                  child: Text(
                    cAppNameDetailed,
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:misafu/src/features/authentication/screens/welcome_screen/welcome_screen.dart';
import '../../features/authentication/screens/home_screen/admin/admin_home.dart';
import '../../features/authentication/screens/on_boarding/on_boarding_screen.dart';


class FadeInAnimationController extends GetxController {

  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 1800));
    animate.value = false;
    await Future.delayed(const Duration(milliseconds: 1800));
    // Get.to(() => const WelcomeScreen());
    Get.offAll(() => const WelcomeScreen());
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;
  }

}
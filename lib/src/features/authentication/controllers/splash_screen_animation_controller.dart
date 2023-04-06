import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:misafu/src/features/authentication/screens/home/admin/admin_home.dart';


class SplashScreenAnimationController extends GetxController {

  static SplashScreenAnimationController get find => Get.find();

  RxBool animate = false.obs;

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    animate.value = true;

    await Future.delayed(const Duration(milliseconds: 1800));

    Get.to(() => MyHomePage(title: cHome.toUpperCase()));
  }

}
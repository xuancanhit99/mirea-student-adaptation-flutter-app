import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:misafu/main.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/sizes.dart';
import 'package:misafu/src/constants/text_strings.dart';

import '../home/admin/admin_home.dart';

class SplashScreenAnimation extends StatefulWidget {
  const SplashScreenAnimation({Key? key}) : super(key: key);

  @override
  State<SplashScreenAnimation> createState() => _SplashScreenAnimationState();
}

class _SplashScreenAnimationState extends State<SplashScreenAnimation> {
  bool animate = false;



  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositioned(
              duration: const Duration(milliseconds: 5000),
              top: animate ? 0 : -80,
              left: animate ? 0 : -80,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: cLogoMireaColor),
              )),
          AnimatedPositioned(
              duration: const Duration(milliseconds: 2500),
              bottom: animate ? 60 : 30,
              right: 30,
              child: AnimatedOpacity(
                opacity: animate ? 1 : 0,
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
          Positioned(

              top: 100,
              // left: cDefaultSize,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: animate ? 1 : 0,
                child: Text(
                  cAppNameDetailed,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
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

  Future startAnimation() async {
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(milliseconds: 1800));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(title: "HOME")));
    }
  }
}

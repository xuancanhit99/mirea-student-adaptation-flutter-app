import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:misafu/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:misafu/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:misafu/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/text_strings.dart';
import 'package:misafu/src/features/authentication/screens/login/login_screen.dart';

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
      backgroundColor: isDarkMode ? cSecondaryColor : cPrimaryColor,
      body: Stack(
        children: [
          CFadeInAnimation(
            durationInMs: 1200,
            animate: CAnimatePosition(
              bottomAfter: 0, bottomBefore: -100,
              leftAfter: 0, leftBefore: 0,
              rightAfter: 0, rightBefore: 0,
              topAfter: 0, topBefore: 0,
            ),
            child: Container(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(image: AssetImage(cResearchImage), height: height * 0.6, width: width * 0.6),
                  Column(
                    children: [
                      Text(
                        cWelcomeTitle,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      Text(
                        cWelcomeSubTitle,
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: OutlinedButton(
                              onPressed: () => Get.to(() => const LoginScreen()),
                              child: Text(cLogin.toUpperCase()))),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                          child: ElevatedButton(
                              onPressed: () {},

                              child: Text(cRes.toUpperCase()))),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

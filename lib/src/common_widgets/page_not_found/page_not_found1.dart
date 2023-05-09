import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:msa/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/colors.dart';
import 'package:msa/src/constants/text_strings.dart';

class PageNotFound1 extends StatelessWidget {
  const PageNotFound1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return WillPopScope(
      onWillPop: () async {
        Get.back();
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: isDarkMode ? cDarkColor : cWhiteColor,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(LineAwesomeIcons.angle_left),
            ),
            centerTitle: true,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 40,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            c404,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontSize: 100, color: cBlue404Space),
                          ),
                          Text(
                            cPageNotFoundTitle,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall?.copyWith(color: cBlue404Space),
                          ),
                        ],
                      ),
                      Lottie.asset(c404NotFoundSpaceError),
                      Text(
                        cPageNotFoundSubTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge?.copyWith(fontSize: 17),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () => Get.back(),
                            child: Text(cGoBack.toUpperCase())),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          cCopyright,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

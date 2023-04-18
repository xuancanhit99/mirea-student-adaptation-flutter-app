import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';


import '../../constants/colors.dart';
import 'fade_in_animation_controller.dart';


class CFadeInAnimation extends StatelessWidget {
  CFadeInAnimation({
    super.key,
    required this.durationInMs,
    required this.child,
    this.animate,
  });

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final CAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
          bottom: controller.animate.value ? animate!.bottomAfter : animate!.bottomBefore,
          left: controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
          right: controller.animate.value ? animate!.rightAfter : animate!.rightBefore,
          child: AnimatedOpacity(
            opacity: controller.animate.value ? 1 : 0,
            duration: Duration(milliseconds: durationInMs),
            child: child,
          )),


          // () => AnimatedPositioned(
          // duration: const Duration(milliseconds: 5000),
          // top: controller.animate.value ? -30 : -80,
          // left: controller.animate.value ? -30 : -80,
          // child: Container(
          //   width: 220,
          //   height: 220,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(200),
          //       color: cLogoMireaColor),
          // )
    // ),
    );
  }
}
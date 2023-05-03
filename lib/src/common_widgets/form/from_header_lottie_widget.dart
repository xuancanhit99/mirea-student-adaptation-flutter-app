import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FormHeaderLottieWidget extends StatelessWidget {
  const FormHeaderLottieWidget({
    Key? key,
    this.lottieColor,
    this.heightBetween,
    required this.lottie,
    required this.title,
    required this.subtitle,
    this.lottieHeight = 0.2,
    this.textAlign,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final Color? lottieColor;
  final double lottieHeight;
  final double? heightBetween;
  final String lottie, title, subtitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Lottie.asset(lottie,
            height: size.height * lottieHeight, width: size.width * 0.6),
        SizedBox(
          height: heightBetween,
        ),
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        Text(subtitle,
            textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

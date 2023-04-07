import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../models/model_on_boarding.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(30),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // mainAxisSize: MainAxisSize.max,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(model.image, height: size.height * 0.5),
          Column(
            children: [
              Text(model.title, style: Theme.of(context).textTheme.headlineSmall, textAlign: TextAlign.center,),
              Text(model.subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,),
            ],
          ),
          Text(model.counterText, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16), textAlign: TextAlign.center,),
          const SizedBox(height: 80.0,)
        ],
      ),);
  }
}

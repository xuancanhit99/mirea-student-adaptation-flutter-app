import 'package:flutter/material.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(cResearchImage), height: height * 0.2, width: width * 0.6),
        Text(cWelcomeBack, style: Theme.of(context).textTheme.headlineSmall,),
        Text(cWelcomeBackSubTitle, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
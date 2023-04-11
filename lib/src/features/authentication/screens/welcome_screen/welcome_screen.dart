import 'package:flutter/material.dart';
import 'package:misafu/src/constants/assets_strings.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? cSecondaryColor : cPrimaryColor,
      body: Container(
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
                        onPressed: () {},
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
    );
  }
}

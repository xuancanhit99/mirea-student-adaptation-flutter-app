import 'package:flutter/material.dart';
import 'package:misafu/main.dart';
import 'package:misafu/src/constants/colors.dart';
import 'package:misafu/src/constants/image_strings.dart';
import 'package:misafu/src/constants/sizes.dart';
import 'package:misafu/src/constants/text_strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;


  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(microseconds: 1600),
                top: animate ? 0 : -30,
                left: animate ? 0 : -30,
                child: Container(
                  width: cSplashContainerSize + 50,
                  height: cSplashContainerSize + 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: cPrimaryColor,
                  ),
                )
            ),
            Positioned(
                top: 80,
                left: cDefaultSize,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cAppName, style: Theme.of(context).textTheme.headlineSmall,),
                    Text(cAppNameDetailed, style: Theme.of(context).textTheme.titleLarge,)
                  ],
                )
            ),
            const Positioned(
                top: 300,
                height: 300,
                child: Image(
                  image: AssetImage(cSplashImage),
                )
            ),
            Positioned(
                bottom: 40,
                right: cDefaultSize,
                child: Container(
                  width: cSplashContainerSize,
                  height: cSplashContainerSize,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: cPrimaryColor,
                  ),

                )
            ),
          ],
        ),
      ),
    );
  }

  Future startAnimation() async {
    await Future.delayed(const Duration(microseconds: 500));
    setState(() {
      animate = true;
    });
    await Future.delayed(const Duration(microseconds: 5000));
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: "HOME")));
  }
}
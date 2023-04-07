import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../constants/assets_strings.dart';
import '../../../constants/colors.dart';
import '../../../constants/text_strings.dart';
import '../models/model_on_boarding.dart';
import '../screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingController extends GetxController {
  final controller = LiquidController();
  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: cDeveloperWorkingJson,
      title: cOnBoardingTitle1,
      subTitle: cOnBoardingSubTitle1,
      counterText: cOnBoardingCounter1,
      bgColor: cOnBoardingPage1Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: cCloudComputingJson,
      title: cOnBoardingTitle2,
      subTitle: cOnBoardingSubTitle2,
      counterText: cOnBoardingCounter2,
      bgColor: cOnBoardingPage2Color,
    )),
    OnBoardingPageWidget(
        model: OnBoardingModel(
      image: cOfficeIllustrationJson,
      title: cOnBoardingTitle3,
      subTitle: cOnBoardingSubTitle3,
      counterText: cOnBoardingCounter3,
      bgColor: cOnBoardingPage3Color,
    )),
  ];

  onPageChangedCallback(int activePageIndex) {
    currentPage.value = activePageIndex;
  }
  animateToNextSlide(){
    int nextPage = controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
  }
  skip() => controller.jumpToPage(page: 2);
}

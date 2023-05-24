import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/sizes.dart';
import 'package:msa/src/features/core/screens/dashboard/student_dashboard.dart';

import '../../../../../common_widgets/form/from_header_lottie_widget.dart';
import '../../../../../localization/language_service.dart';
import '../../login/student/student_login_screen.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.off(() => const StudentLoginScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Get.off(() => const StudentLoginScreen()),
                icon: const Icon(LineAwesomeIcons.angle_left),
              ),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: cDefaultSize * 4,
                    ),
                    FormHeaderLottieWidget(
                      lottie: cEmailVerificationJson,
                      title: LanguageService.cVerifyEmail,
                      subtitle:
                          '${LanguageService.cAnEmailHasBeenSentToYou}\n${LanguageService.cCheckTheEmailToVerifyYourAccount}',
                      crossAxisAlignment: CrossAxisAlignment.center,
                      heightBetween: 10,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {
                              Get.off(() => const StudentLoginScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                                LanguageService.cBackToLogin.toUpperCase()))),
                    const SizedBox(height: 20),
                    TextButton.icon(
                        onPressed: () =>
                            Get.off(() => const StudentDashboard()),
                        icon: const Icon(
                          LineAwesomeIcons.arrow_right,
                          color: Colors.blue,
                        ),
                        label: Text(
                          LanguageService.cSkipForNow,
                          style: const TextStyle(color: Colors.blue),
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

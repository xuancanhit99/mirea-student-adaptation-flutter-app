import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/sizes.dart';
import 'package:msa/src/features/authentication/controllers/student/student_forgot_password_controller.dart';
import 'package:otp_timer_button/otp_timer_button.dart';

import '../../../../../common_widgets/form/from_header_lottie_widget.dart';
import '../../../../../localization/language_service.dart';
import '../../login/student/student_login_screen.dart';

class ForgotPasswordEmailSent extends StatelessWidget {
  const ForgotPasswordEmailSent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpTimerButtonController controller = OtpTimerButtonController();
    requestOtp() {
      controller.loading();
      Future.delayed(const Duration(seconds: 2), () {
        controller.startTimer();
      });
    }

    final studentForgotPasswordController =
        Get.put(StudentForgotPasswordController());
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => const StudentLoginScreen());
        return false;
      },
      child: SafeArea(
        child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () => Get.offAll(() => const StudentLoginScreen()),
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
                      title: LanguageService.cResetPassword,
                      subtitle:
                          '${LanguageService.cAnEmailHasBeenSentToYou}\n${LanguageService.cCheckTheEmailToChangePasswordYourAccount}',
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
                              Get.offAll(() => const StudentLoginScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                                LanguageService.cBackToLogin.toUpperCase()))),
                    const SizedBox(height: 20),
                    OtpTimerButton(
                      controller: controller,
                      onPressed: () {
                        requestOtp();
                        // Get.snackbar("Info", studentForgotPasswordController.emailForgotPasswordController.text.trim());
                        studentForgotPasswordController.forgotPassword(
                          studentForgotPasswordController
                              .emailForgotPasswordController.text
                              .trim(),
                        );
                      },
                      text: Text(
                        LanguageService.cResendEmail,
                        style: const TextStyle(color: Colors.blue),
                      ),
                      duration: 60,
                      buttonType: ButtonType.text_button,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

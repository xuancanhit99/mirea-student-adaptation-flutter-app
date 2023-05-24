import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/common_widgets/form/form_header_widget.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/features/authentication/screens/forgot_password/mail/forgot_password_email_sent.dart';

import '../../../../../localization/language_service.dart';
import '../../../controllers/student/student_forgot_password_controller.dart';
import '../../login/student/student_login_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final studentForgotPasswordController =
        Get.put(StudentForgotPasswordController());
    final formKey = GlobalKey<FormState>();
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
                      height: 30 * 4,
                    ),
                    FormHeaderWidget(
                      image: cForgotPasswordImage,
                      title: LanguageService.cForgotPassword,
                      subtitle: LanguageService.cForgotPasswordViaEmailSubTitle,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      heightBetween: 30,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: studentForgotPasswordController
                                .emailForgotPasswordController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                label: Text(LanguageService.cEmail),
                                // hintText: cEmail,
                                prefixIcon: const Icon(Icons.email_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!EmailValidator.validate(
                                  value, true)) {
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      studentForgotPasswordController
                                          .forgotPassword(
                                        studentForgotPasswordController
                                            .emailForgotPasswordController.text
                                            .trim(),
                                      );
                                      Get.to(() =>
                                          const ForgotPasswordEmailSent());
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: Text(LanguageService.cNext)))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

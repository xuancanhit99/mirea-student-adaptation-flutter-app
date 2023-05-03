import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:msa/src/common_widgets/form/form_header_widget.dart';
import 'package:msa/src/constants/assets_strings.dart';
import 'package:msa/src/constants/text_strings.dart';
import 'package:msa/src/features/authentication/screens/forgot_password/otp/otp_screen.dart';
import 'package:msa/src/features/authentication/screens/signup/email_verification/email_verification.dart';

import '../../login/student/student_login_screen.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    const FormHeaderWidget(
                      image: cForgotPasswordImage,
                      title: cForgotPassword,
                      subtitle: cForgotPasswordViaEmailSubTitle,
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
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                label: Text(cEmail),
                                // hintText: cEmail,
                                prefixIcon: Icon(Icons.email_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your email';
                              } else if (!EmailValidator.validate(value, true)) {
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
                                      Get.to(() =>
                                          const EmailVerificationScreen());
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide.none,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text(cNext)))
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

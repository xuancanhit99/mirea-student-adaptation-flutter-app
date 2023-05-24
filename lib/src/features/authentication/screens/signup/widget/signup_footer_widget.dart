import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/screens/login/student/student_login_screen.dart';

import '../../../../../constants/assets_strings.dart';
import '../../../../../localization/language_service.dart';
import '../../../controllers/student/student_signup_controller.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final studentSignUpController = Get.put(StudentSignUpController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(LanguageService.cOR),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              studentSignUpController.signUpWithGoogleSignUpController();
            },
            icon: const Image(
              image: AssetImage(cGoogleLogo),
              width: 20,
            ),
            style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
            label: Text(LanguageService.cSignUpWithGoogle.toUpperCase()),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
            onPressed: () => Get.off(() => const StudentLoginScreen()),
            child: Text.rich(TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(text: LanguageService.cAlreadyHaveAnAccount),
                  TextSpan(
                      text: LanguageService.cLogin,
                      style: const TextStyle(color: Colors.blue))
                ]))),
      ],
    );
  }
}

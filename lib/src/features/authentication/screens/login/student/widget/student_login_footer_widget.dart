import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../../../constants/assets_strings.dart';
import '../../../../../../localization/language_service.dart';
import '../../../../controllers/student/student_login_controller.dart';
import '../../admin/admin_login_screen.dart';

class StudentLoginFooterWidget extends StatelessWidget {
  const StudentLoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(StudentLoginController());
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
              icon: const Image(
                image: AssetImage(cGoogleLogo),
                width: 20.0,
              ),
              style: OutlinedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () {
                loginController.signInWithGoogle();
              },
              label: Text(LanguageService.cSignInWithGoogle.toUpperCase())),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Get.off(() => const SignUpScreen()),
          child: Text.rich(TextSpan(
              text: LanguageService.cDoNotHaveAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                    text: LanguageService.cRes,
                    style: const TextStyle(color: Colors.blue))
              ])),
        ),
        TextButton(
          onPressed: () => Get.off(() => const AdminLoginScreen()),
          child: Text.rich(TextSpan(
              text: LanguageService.cAreYouAnAdmin,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                    text: LanguageService.cLogin,
                    style: const TextStyle(color: Colors.blue))
              ])),
        ),
      ],
    );
  }
}

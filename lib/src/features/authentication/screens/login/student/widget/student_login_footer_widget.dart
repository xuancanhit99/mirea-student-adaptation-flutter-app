import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../../../constants/assets_strings.dart';
import '../../../../../../constants/text_strings.dart';
import '../../admin/admin_login_screen.dart';


class StudentLoginFooterWidget extends StatelessWidget {
  const StudentLoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
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
              onPressed: () {},
              label: Text(cSignInWithGoogle.toUpperCase())),
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton(
          onPressed: () => Get.off(() => const SignUpScreen()),
          child: Text.rich(TextSpan(
              text: cDoNotHaveAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(text: cRes, style: TextStyle(color: Colors.blue))
              ])),
        ),
        TextButton(
          onPressed: () => Get.off(() => const AdminLoginScreen()),
          child: Text.rich(TextSpan(
              text: cAreYouAnAdmin,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(text: cLogin, style: TextStyle(color: Colors.blue))
              ])),
        ),
      ],
    );
  }
}
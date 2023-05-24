import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../localization/language_service.dart';
import '../../student/student_login_screen.dart';

class AdminLoginFooterWidget extends StatelessWidget {
  const AdminLoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () => Get.off(() => const StudentLoginScreen()),
        child: Text.rich(TextSpan(
            text: LanguageService.cAreYouAStudent,
            style: Theme.of(context).textTheme.bodyLarge,
            children: [
              TextSpan(
                  text: LanguageService.cLogin,
                  style: const TextStyle(color: Colors.blue))
            ])),
      ),
    );
  }
}

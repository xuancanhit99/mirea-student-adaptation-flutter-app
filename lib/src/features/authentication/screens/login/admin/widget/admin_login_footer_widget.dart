import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../constants/text_strings.dart';
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
            text: cAreYouAStudent,
            style: Theme.of(context).textTheme.bodyLarge,
            children: const [
              TextSpan(text: cLogin, style: TextStyle(color: Colors.blue))
            ])),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../repository/student_repository/student_repository.dart';

class StudentForgotPasswordController extends GetxController {
  static StudentForgotPasswordController get instance => Get.find();

  final emailForgotPasswordController = TextEditingController();

  Future<void> forgotPassword(String email) async {
    await AuthenticationRepository.instance
        .sendPasswordResetEmailAuthRepo(email);
    // Get.snackbar(
    //     "Success", "A password reset link has been sent to your email.",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.white,
    //     colorText: Colors.green);
  }
}

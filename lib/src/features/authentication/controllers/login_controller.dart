import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/authentication_repository/exceptions/signin_email_password_failure.dart';
import '../../../repository/student_repository/student_repository.dart';
import '../../core/screens/dashboard/dashboard.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.toggle();
  }

  final studentRepo = Get.put(StudentRepository());

  Future<void> loginStudent(String email, String password) async {
    try {
      await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final fullName = currentUser.displayName;
        Get.snackbar('Welcome', 'Welcome $fullName!');
      }
    } on SignInWithEmailAndPasswordFailure catch (e) {
      Get.snackbar('Error', e.message);
    } catch (e) {
      Get.snackbar('Error', 'An unknown error occurred.');
    }
    // String? error = AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password) as String?;
    // if (error != null) {
    //   Get.showSnackbar(GetSnackBar(message: error.toString()));
    // }
  }

  // Future<void> loginStudent(String email, String password) async {
  //   loginStudentAndCheckError(email, password);
  //   // await studentRepo.getStudentDetailsRepo(email);
  // }
}

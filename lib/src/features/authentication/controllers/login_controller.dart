import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/authentication_repository/exceptions/signin_email_password_failure.dart';
import '../../../repository/student_repository/student_repository.dart';
import '../../core/controllers/student_controller.dart';
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
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    } else {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final uid = currentUser.uid;
        final studentData = await studentRepo.getStudentDetailsByUid(uid);
        final name = studentData.fullName;
        Get.snackbar('Welcome', 'Welcome $name!');
      }
    }

    // try {
    //   await AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password);
    //
    //   final currentUser = FirebaseAuth.instance.currentUser;
    //
    //   if (currentUser != null) {
    //     final email = currentUser.email;
    //     final studentData = await studentRepo.getStudentDetailsRepo(email!);
    //     final name = studentData.fullName;
    //     Get.snackbar('Welcome', 'Welcome $name!');
    //     // Get.snackbar('Welcome', 'Welcome $email!');
    //   }
    // } on SignInWithEmailAndPasswordFailure catch (e) {
    //   Get.snackbar('Error', e.message);
    // } catch (e) {
    //   Get.snackbar('Error', 'An unknown error occurred.');
    // }
    // String? error = AuthenticationRepository.instance.loginUserWithEmailAndPassword(email, password) as String?;
    // if (error != null) {
    //   Get.showSnackbar(GetSnackBar(message: error.toString()));
    // }
  }

}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../repository/student_repository/student_repository.dart';

class StudentLoginController extends GetxController {
  static StudentLoginController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Show password
  var showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.toggle();
  }

  // Remember me
  final _prefs = Get.find<SharedPreferences>();
  final _emailKey = 'student_email';
  final _passwordKey = 'student_password';
  var rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRememberMe();
  }

  final studentRepo = Get.put(StudentRepository());

  Future<void> loadRememberMe() async {
    // emailController.text = "xuancanhit99@gmail.com";
    // passwordController.text = "12345678";
    final savedEmail = _prefs.getString(_emailKey);
    if (savedEmail != null) {
      emailController.text = savedEmail;
    }
    final savedPassword = _prefs.getString(_passwordKey);
    if (savedPassword != null) {
      passwordController.text = savedPassword;
    }
    rememberMe.value = savedEmail != null && savedPassword != null;
  }

  Future<void> loginStudent(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPasswordAuthRepo(email, password) as String?;
    if (error != null) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
    } else {
      if (rememberMe.value) {
        _prefs.setString(_emailKey, email);
        _prefs.setString(_passwordKey, password);
      } else {
        _prefs.remove(_emailKey);
        _prefs.remove(_passwordKey);
      }
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        final uid = currentUser.uid;
        final studentData = await studentRepo.getStudentDetailsByUid(uid);
        final isAdmin = studentData.isAdmin;
        if (isAdmin) {
          Get.snackbar(
              "Error", "You are not a student. Please login as an admin.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white,
              colorText: Colors.red);
          await AuthenticationRepository.instance.logoutAuthRepo();
          return;
        }
        // else {
        //   final name = studentData.fullName;
        //   Get.snackbar('Welcome to MSA', 'Hi, $name!',
        //       snackPosition: SnackPosition.TOP,
        //       backgroundColor: Colors.white);
        // }
      }
    }
  }

  Future<void> signInWithGoogle() async {
    final UserCredential userCredential =
        await AuthenticationRepository.instance.signInWithGoogleAuthRepo();
    final User? user = userCredential.user;

    if (user != null) {
      final uid = user.uid;
      final studentData = await studentRepo.getStudentDetailsByUid(uid);
      final isAdmin = studentData.isAdmin;
      if (isAdmin) {
        await AuthenticationRepository.instance.logoutAuthRepo();
        Get.snackbar(
            "Error", "You are not a student. Please login as an admin.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.red);
        return;
      }
      // else {
      // final name = studentData.fullName;
      // Get.snackbar('Welcome to MSA', 'Hi, $name!',
      //     snackPosition: SnackPosition.TOP,
      //     backgroundColor: Colors.white);
      // Navigate to dashboard screen
      //   Get.offAll(() => const Dashboard());
      // }
    }
  }
}

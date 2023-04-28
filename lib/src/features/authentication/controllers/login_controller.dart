import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/student_repository/student_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Show password
  var showPassword = false.obs;
  void toggleShowPassword() {
    showPassword.toggle();
  }

  // Remember me
  final _prefs = Get.find<SharedPreferences>();
  final _emailKey = 'email';
  final _passwordKey = 'password';
  var rememberMe = false.obs;

  LoginController() {
    loadRememberMe();
  }

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
        .loginUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
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
        final name = studentData.fullName;
        Get.snackbar('Welcome to MSA', 'Hi, $name!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.white);
      }
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/admin_repository/admin_repository.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';

class AdminLoginController extends GetxController {
  static AdminLoginController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Show password
  var showPassword = false.obs;
  void toggleShowPassword() {
    showPassword.toggle();
  }

  // Remember me
  final _prefs = Get.find<SharedPreferences>();
  final _emailKey = 'admin_email';
  final _passwordKey = 'admin_password';
  var rememberMe = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadRememberMe();
  }


  final adminRepo = Get.put(AdminRepository());

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

  Future<void> loginAdmin(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red
      );
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
        final adminData = await adminRepo.getAdminDetailsByUid(uid);
        final isAdmin = adminData.isAdmin;
        print(isAdmin);
        if (!isAdmin) {
          Get.snackbar("Error", "You are not an admin. Please login as a student.",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.white,
              colorText: Colors.red
          );
          await AuthenticationRepository.instance.logout();
          return;
        } else {
          final name = adminData.fullName;
          Get.snackbar('Welcome to MSA', 'Hi, $name!',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.white);
        }
      }
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.toggle();
  }

  void login() async {
  }

}
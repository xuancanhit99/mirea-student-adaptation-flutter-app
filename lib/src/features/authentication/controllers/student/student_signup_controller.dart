import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
import 'package:msa/src/repository/student_repository/student_repository.dart';

import '../../screens/forgot_password/otp/otp_screen.dart';
class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final groupController = TextEditingController();

  // Show password
  var showPassword = false.obs;
  void toggleShowPassword() {
    showPassword.toggle();
  }

  var validatePassword = false.obs;

  final studentRepo = Get.put(StudentRepository());

  Future<void> signUpController(StudentModel student) async {
    String uid = await AuthenticationRepository.instance.createUserWithEmailAndPasswordRepo(student);
    await studentRepo.createStudentRepo(student, uid);
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

}
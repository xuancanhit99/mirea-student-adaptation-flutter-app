import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:misafu/src/features/authentication/models/student_model.dart';
import 'package:misafu/src/repository/authentication_repository/authentication_repository.dart';
import 'package:misafu/src/repository/student_repository/student_repository.dart';

import '../screens/forgot_password/otp/otp_screen.dart';
class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  final studentRepo = Get.put(StudentRepository());

  void registerUser(String email, String password) {
    String? error = AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  Future<void> createStudent(StudentModel student) async {
    await studentRepo.createStudent(student);
    registerUser(student.email, student.password);
    //phoneAuthentication(student.phoneNo);
    Get.to(() => const OTPScreen());
  }

}
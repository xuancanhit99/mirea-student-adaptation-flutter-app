import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
import 'package:msa/src/repository/student_repository/student_repository.dart';


class StudentSignUpController extends GetxController {
  static StudentSignUpController get instance => Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final groupController = TextEditingController();

  final now = DateTime.now();

  final uid = FirebaseAuth.instance.currentUser?.uid;

  // Show password
  var showPassword = false.obs;

  void toggleShowPassword() {
    showPassword.toggle();
  }

  var validatePassword = false.obs;

  final studentRepo = Get.put(StudentRepository());

  Future<void> signUpController(StudentModel student) async {
    String uid = await AuthenticationRepository.instance
        .createUserWithEmailAndPasswordAuthRepo(student);
    await studentRepo.createStudentRepo(student, uid);
  }

  Future<void> signUpWithGoogleSignUpController() async {
    String uid = await AuthenticationRepository.instance.signUpWithGoogleAuthRepo();
    final firebaseUser = AuthenticationRepository.instance.firebaseUser.value;
    if (firebaseUser != null) {
      final student = StudentModel(
        id: uid,
        fullName: firebaseUser.displayName ?? '',
        email: firebaseUser.email ?? '',
        password: '',
        group: '',
        phoneNo: '',
        img: '',
        dob: '',
        address: const Address(
            city: '',
            street: '',
            house: '',
            building: '',
            dormitory: '',
            placeOfBirth: '',
            nationality: ''
        ),
        gender: null,
        isActive: false,
        isAdmin: false,
      );
      await studentRepo.createStudentRepo(student, uid);
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
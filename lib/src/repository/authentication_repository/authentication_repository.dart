import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/authentication/screens/login/login_screen.dart';
import 'package:msa/src/features/core/screens/dashboard/dashboard.dart';
import 'package:msa/src/repository/authentication_repository/exceptions/signin_email_password_failure.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';
import '../student_repository/student_repository.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const Dashboard());
  }

  Future<void> phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar('Error', 'The provided phone number is not valid.');
          } else {
             Get.snackbar('Error', 'Something went wrong. Try again.');
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  Future<String> createUserWithEmailAndPasswordRepo(StudentModel student) async {
    String uid = '';
    try {
      await _auth.createUserWithEmailAndPassword(
          email: student.email, password: student.password).then((value) {
        uid = value.user!.uid;
      });
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
    return uid;
  }

  Future<void> loginUserWithEmailAndPassword(String email,
      String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? {
      Get.offAll(() => const Dashboard())
    }: Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
    final ex = SignInWithEmailAndPasswordFailure.code(e.code);
    Get.snackbar("Error", ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.red);
    print('FIREBASE AUTH EXCEPTION - ${ex.message}');
    throw ex;
    }
    catch (_) {
    const ex = SignInWithEmailAndPasswordFailure();
    Get.snackbar("Error", ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.red);
    print('EXCEPTION - ${ex.message}');
    throw ex;
    }
  }

  Future<void> logout() async => await _auth.signOut();
}

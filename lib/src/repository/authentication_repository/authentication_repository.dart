import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/features/authentication/screens/login/student/student_login_screen.dart';
import 'package:msa/src/features/authentication/screens/signup/email_verification/email_verification.dart';
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

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const Dashboard());
      } else {
        sendEmailVerificationAuthRepo();
        Get.offAll(() => const EmailVerificationScreen());
      }
    } else {
      Get.offAll(() => const StudentLoginScreen());
    }
  }

  // Future<bool> isAuthenticated() async {
  //   final user = firebaseUser.value;
  //   return user != null;
  // }

  Future<void> sendEmailVerificationAuthRepo() async {
    final user = firebaseUser.value;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
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

  Future<String> createUserWithEmailAndPasswordAuthRepo(
      StudentModel student) async {
    String uid = '';
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: student.email, password: student.password)
          .then((value) {
        uid = value.user!.uid;
      });

      // firebaseUser.value != null
      //     ? Get.offAll(() => const Dashboard())
      //     : Get.to(() => const WelcomeScreen());


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

  Future<String> signUpWithGoogleAuthRepo() async {
    String uid = '';
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
      await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final userCredential = await _auth.signInWithCredential(credential);
      final user = userCredential.user;
      if (user != null) {
        uid = user.uid;
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      rethrow;
    }
    return uid;
  }

  Future<UserCredential> signInWithGoogleAuthRepo() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
    await googleUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    try {
      final userCredential = await _auth.signInWithCredential(credential);
      // final UserCredential userCredential = await _auth.signInWithCredential(googleProvider);
      return userCredential;
    } catch (e) {
      print('FIREBASE AUTH EXCEPTION - $e');
      rethrow;
    }
  }

  Future<void> loginUserWithEmailAndPasswordAuthRepo(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);


      // firebaseUser.value != null
      //     ? {Get.offAll(() => const Dashboard())}
      //     : Get.to(() => const WelcomeScreen());


    } on FirebaseAuthException catch (e) {
      final ex = SignInWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignInWithEmailAndPasswordFailure();
      Get.snackbar("Error", ex.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<void> sendPasswordResetEmailAuthRepo(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message!,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      throw e;
    } catch (e) {
      final ex = Exception('An error occurred while resetting your password. Please try again later.');
      Get.snackbar("Error", ex.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      throw ex;
    }
  }

  Future<void> logoutAuthRepo() async => await _auth.signOut();
}

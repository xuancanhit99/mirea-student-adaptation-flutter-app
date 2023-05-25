import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_timer_button/otp_timer_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../repository/admin_repository/admin_repository.dart';
import '../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../repository/student_repository/student_repository.dart';

class AdminChangePasswordController extends GetxController {
  static AdminChangePasswordController get instance => Get.find();

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final reEnterNewPasswordController = TextEditingController();

  var showOldPassword = false.obs;
  void toggleShowOldPassword() {
    showOldPassword.toggle();
  }

  var showNewPassword = false.obs;
  void toggleShowNewPassword() {
    showNewPassword.toggle();
  }

  var showReEnterNewPassword = false.obs;
  void toggleShowReEnterNewPassword() {
    showReEnterNewPassword.toggle();
  }

  var validatePassword = false.obs;

  final _authRepo = Get.put(AuthenticationRepository());
  final _adminRepo = Get.put(AdminRepository());



  Future<void> changePassword(String oldPassword, String newPassword) async {
    await AuthenticationRepository.instance
        .changePasswordAuthRepo(oldPassword, newPassword);
  }

  Future<void> checkPassword(String oldPassword, String newPassword, String reEnterNewPassword) async {
    if (oldPassword == newPassword) {
      Get.snackbar("Error", "New password must be different from old password.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
    } else if (newPassword != reEnterNewPassword) {
      Get.snackbar("Error", "Re-enter new password must be the same as new password.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
    } else {
      final uid = _authRepo.firebaseUser.value?.uid;
      changePassword(oldPassword, newPassword);
      _adminRepo.updateNewPasswordStudentRepo(newPassword, uid!);
    }
  }

}



import 'package:get/get.dart';
import 'package:msa/src/features/core/screens/dashboard/student/student_dashboard.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTPAuthRepo(otp);
    isVerified ? Get.offAll(const StudentDashboard()) : Get.back();
  }
}
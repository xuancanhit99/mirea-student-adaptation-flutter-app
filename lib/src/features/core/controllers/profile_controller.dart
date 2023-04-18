import 'package:get/get.dart';
import 'package:misafu/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/student_repository/student_repository.dart';
import '../../authentication/models/student_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _studentRepo = Get.put(StudentRepository());

  // Get student email and pass to StudentRepository to fetch user record
  getStudentData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _studentRepo.getStudentDetailsRepo(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Future<List<StudentModel>> getAllStudent() async {
    return await _studentRepo.getAllStudentRepo();
  }

}
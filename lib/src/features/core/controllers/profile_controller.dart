import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/student_repository/student_repository.dart';
import '../../authentication/models/student_model.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // final email = TextEditingController();
  // final password = TextEditingController();
  // final fullName = TextEditingController();
  // final phoneNo = TextEditingController();


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


  Future<void> updateStudent(StudentModel student) async {
    await _studentRepo.updateStudentRepo(student);
  }

}
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/student_repository/student_repository.dart';
import '../../authentication/models/student_model.dart';

class AllStudentsController extends GetxController {
  static AllStudentsController get instance => Get.find();

  final _studentRepo = Get.put(StudentRepository());

  Future<List<StudentModel>> getAllStudent() async {
    return await _studentRepo.getAllStudentRepo();
  }

}
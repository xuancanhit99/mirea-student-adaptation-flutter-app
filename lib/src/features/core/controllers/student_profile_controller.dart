import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';

import '../../../repository/student_repository/student_repository.dart';
import '../../authentication/models/student_model.dart';

class StudentProfileController extends GetxController {
  static StudentProfileController get instance => Get.find();

  final id = TextEditingController();
  final no = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final group = TextEditingController();
  final phoneNo = TextEditingController();
  var img = "".obs;
  final dob = TextEditingController();
  final age = TextEditingController();
  final gender = TextEditingController();
  final isActive = TextEditingController();
  final isAdmin = TextEditingController();
  late final DateTime createAt;
  late final DateTime updateAt;




  final _authRepo = Get.put(AuthenticationRepository());
  final _studentRepo = Get.put(StudentRepository());

  @override
  void onInit() {
    super.onInit();
    getStudentData();
  }

  // int calculateAge(String dateOfBirth) {
  //   final parts = dateOfBirth.split('-');
  //   final birthDate = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
  //   final now = DateTime.now();
  //   int age = now.year - birthDate.year;
  //   if (now.month < birthDate.month ||
  //       (now.month == birthDate.month && now.day < birthDate.day)) {
  //     age--;
  //   }
  //   return age;
  // }

  getStudentData() async {
    final uid = _authRepo.firebaseUser.value?.uid;
    if (uid != null) {
      StudentModel student = await _studentRepo.getStudentDetailsByUid(uid);
      id.text = student.id!;
      no.text = student.no!;
      fullName.text = student.fullName;
      email.text = student.email;
      password.text = student.password;
      group.text = student.group;
      phoneNo.text = student.phoneNo!;
      img.value = student.img!;
      dob.text = student.dob!;
      // age.text = calculateAge(student.dob!).toString();
      if(student.gender == null) {
        gender.text = "";
      } else if (student.gender == true) {
        gender.text = "Male";
      } else {
        gender.text = "Female";
      }
      if (student.isActive == true) {
        isActive.text = "Active";
      } else {
        isActive.text = "Inactive";
      }
      if (student.isAdmin == true) {
        isAdmin.text = "Admin";
      } else {
        isAdmin.text = "Student";
      }
      createAt = student.createdAt!;
      updateAt = student.updatedAt!;
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  // Get student email and pass to StudentRepository to fetch user record
  getStudentDataFromEmail() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _studentRepo.getStudentDetailsRepo(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  getStudentFromUid() {
    final uid = _authRepo.firebaseUser.value?.uid;
    // print(uid);
    if (uid != null) {
      return _studentRepo.getStudentDetailsByUid(uid);
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

  // Take Photo And Select Photo
  Future<String?> takePhoto() async {
    final uid = _authRepo.firebaseUser.value?.uid;
    return await _studentRepo.imgFromCamera(uid!);
  }

  Future<String?> selectPhoto() async {
    final uid = _authRepo.firebaseUser.value?.uid;
    return await _studentRepo.imgFromGallery(uid!);
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2101));
    if (picked != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      dob.text = formattedDate;
    } else{
      print("Date is not selected");
    }
  }
}
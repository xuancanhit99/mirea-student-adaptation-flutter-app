import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // final age = TextEditingController();
  var gender = "".obs;
  var isActive = false.obs;
  final isAdmin = TextEditingController();
  late final DateTime createAt;
  var updateAt = DateTime.now().obs;

  void toggleSwitchIsActive(bool value) {
    if (isActive.value == false) {
      isActive.value = true;
    } else {
      isActive.value = false;
    }
  }

  final _authRepo = Get.put(AuthenticationRepository());
  final _studentRepo = Get.put(StudentRepository());

  @override
  void onInit() {
    super.onInit();
    getStudentData();
  }

  int calculateAge(String dateOfBirth) {
    if (dateOfBirth == "") {
      return 0;
    }
    final parts = dateOfBirth.split('-');
    final birthDate = DateTime(int.parse(parts[2]), int.parse(parts[1]), int.parse(parts[0]));
    final now = DateTime.now();
    int age = now.year - birthDate.year;
    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      age--;
    }
    return age;
  }

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
      gender.value = student.gender!;
      isActive.value = student.isActive!;
      if (student.isAdmin == true) {
        isAdmin.text = "Admin";
      } else {
        isAdmin.text = "Student";
      }
      createAt = student.createdAt!;
      updateAt.value = student.updatedAt!;
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
      return _studentRepo.getStudentDetailsByUidRealtime(uid);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }

  Stream<List<StudentModel>> getAllStudentRealTime()  {
    return _studentRepo.getAllStudentRealTimeRepo();
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
      String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      dob.text = formattedDate;
    } else {
      print("Date is not selected");
    }
  }

  String getDate(DateTime date) {
    final DateFormat formatter = DateFormat.yMMMMd('en_US').add_jm();
    final String formatted = formatter.format(date);
    return formatted;
  }

  int getCourse(String group) {
    // Split the group string into its components
    List<String> components = group.split('-');

    // Extract the last two digits of the starting school year
    String schoolYearString = components.last;
    int schoolYear = int.parse(schoolYearString);

    // Get the current year
    DateTime now = DateTime.now();
    int currentYear = now.year;

    // Calculate the current school year
    int currentCourse = currentYear - (schoolYear + 2000);

    return currentCourse;
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, MMMM d, y');
    return formatter.format(now);
  }

  Future<void> launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }


  Future<void> deleteStudent() async {
    await _authRepo.deleteUserAuthRepo();
  }
}

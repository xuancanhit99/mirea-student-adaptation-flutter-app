import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:msa/src/features/authentication/models/student_model.dart';
import 'package:msa/src/repository/authentication_repository/authentication_repository.dart';
// import 'package:path/path.dart' as path;

class StudentRepository extends GetxController {
  static StudentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final _storage = firebase_storage.FirebaseStorage.instance;

  File? _photo;
  final ImagePicker _picker = ImagePicker();

  createStudentRepo(StudentModel student, String uid) async {
    await _db
        .collection("Students")
        .doc(uid)
        .set(student.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Your account has been created.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.green))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Some thing went wrong. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print("ERROR - $error");
    });
  }

  Future<StudentModel> getStudentDetailsRepo(String email) async {
    final snapshot =
        await _db.collection("Students").where("Email", isEqualTo: email).get();
    final studentData =
        snapshot.docs.map((e) => StudentModel.fromSnapshot(e)).single;
    return studentData;
  }

  Future<StudentModel> getStudentDetailsByUid(String uid) async {
    final snapshot = await _db.collection("Students").doc(uid).get();
    final studentData = StudentModel.fromSnapshot(snapshot);
    return studentData;
  }

  Stream<StudentModel> getStudentDetailsByUidRealtime(String uid) {
    final snapshot = _db.collection("Students").doc(uid).snapshots();
    final studentData = snapshot.map((e) => StudentModel.fromSnapshot(e));
    return studentData;
  }

  Stream<List<StudentModel>> getAllStudentRealTimeRepo() {
    final snapshot = _db.collection("Students").snapshots();
    final studentData = snapshot.map((querySnapshot) =>
        querySnapshot.docs.map((doc) => StudentModel.fromSnapshot(doc)).toList());
    return studentData;
  }

  Future<List<StudentModel>> getAllStudentRepo() async {
    final snapshot = await _db.collection("Students").get();
    final studentData =
        snapshot.docs.map((e) => StudentModel.fromSnapshot(e)).toList();
    return studentData;
  }

  Future<void> updateStudentRepo(StudentModel student) async {
    await _db
        .collection("Students")
        .doc(student.id)
        .update(student.toJson())
        .whenComplete(() => Get.snackbar(
            "Success", "Student information has been updated.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.white,
            colorText: Colors.green))
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Error while updating student information.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print("ERROR - $error");
    });
  }

  Future<void> updateImgUrl(String imgUrl, String uid) async {
    try {
      await _db.collection("Students").doc(uid).update({"Image": imgUrl});
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  Future deletePreviousFile(String uid) async {
    // Delete the previous file (if it exists)
    try {
      final doc = await _db.collection("Students").doc(uid).get();
      final previousUrl = doc.data()?['Image'];
      if (previousUrl != "") {
        final ref =
            firebase_storage.FirebaseStorage.instance.refFromURL(previousUrl);
        await ref.delete();
        print('Previous file deleted: $previousUrl');
      }
    } catch (e) {
      print('Error deleting previous file: $e');
    }
  }

  Future<String?> uploadFile() async {
    if (_photo == null) return "";
    final dateTime = DateTime.now();
    final fileName =
        '${dateTime.year}${dateTime.month}${dateTime.day}${dateTime.hour}${dateTime.minute}${dateTime.second}${dateTime.millisecond}.jpg';
    const destination = 'student_img';
    try {
      final ref = _storage.ref(destination).child('$fileName/');
      await ref.putFile(_photo!);
      final downloadUrl = await ref.getDownloadURL();
      print('File uploaded: $downloadUrl');
      return downloadUrl;
    } catch (e) {
      print('Error occurred: $e');
      return "";
    }
  }

  Future<String?> imgFromGallery(String uid) async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      deletePreviousFile(uid);
      String? imgUrl = await uploadFile();
      updateImgUrl(imgUrl!, uid);
      return imgUrl;
    } else {
      print('No image selected.');
      return "";
    }
  }

  Future<String?> imgFromCamera(String uid) async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      deletePreviousFile(uid);
      String? imgUrl = await uploadFile();
      updateImgUrl(imgUrl!, uid);
      return imgUrl;
    } else {
      print('No image selected.');
      return "";
    }
  }

  Future<void> deleteStudentRepo(String uid) async {
    await _db.collection("Students").doc(uid).delete();
  }
}

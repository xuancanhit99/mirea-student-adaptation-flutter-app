import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/student_model.dart';

class StudentRepository extends GetxController {
  static StudentRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createStudentRepo(StudentModel student, String uid) async {
    await _db.collection("Students").doc(uid).set(student.toJson()).whenComplete(() =>
      Get.snackbar("Success", "Your account has been created.",
      snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.white,
        colorText: Colors.green
      )
    ).catchError((error, stackTrace){
      Get.snackbar("Error", "Some thing went wrong. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Colors.red);
      print("ERROR - $error");
    });
  }

  Future<StudentModel> getStudentDetailsRepo(String email) async {
    final snapshot = await _db.collection("Students").where("Email", isEqualTo: email).get();
    final studentData = snapshot.docs.map((e) => StudentModel.fromSnapshot(e)).single;
    return studentData;
  }

  Future<StudentModel> getStudentDetailsByUid(String uid) async {
    final snapshot = await _db.collection("Students").doc(uid).get();
    final studentData = StudentModel.fromSnapshot(snapshot);
    return studentData;
  }

  Future<List<StudentModel>> getAllStudentRepo() async {
    final snapshot = await _db.collection("Students").get();
    final studentData = snapshot.docs.map((e) => StudentModel.fromSnapshot(e)).toList();
    return studentData;
  }

  Future<void> updateStudentRepo(StudentModel student) async {
    await _db.collection("Students").doc(student.id).update(student.toJson());
  }

}
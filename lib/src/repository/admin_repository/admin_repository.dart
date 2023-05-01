import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/admin_model.dart';

import '../../features/authentication/models/admin_model.dart';

class AdminRepository extends GetxController {
  static AdminRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<AdminModel> getAdminDetailsRepo(String email) async {
    final snapshot = await _db.collection("Admins").where("Email", isEqualTo: email).get();
    final adminData = snapshot.docs.map((e) => AdminModel.fromSnapshot(e)).single;
    return adminData;
  }

  Future<AdminModel> getAdminDetailsByUid(String uid) async {
    final snapshot = await _db.collection("Admins").doc(uid).get();
    final adminData = AdminModel.fromSnapshot(snapshot);
    return adminData;
  }

  Future<List<AdminModel>> getAllAdminRepo() async {
    final snapshot = await _db.collection("Admins").get();
    final adminData = snapshot.docs.map((e) => AdminModel.fromSnapshot(e)).toList();
    return adminData;
  }

  Future<void> updateAdminRepo(AdminModel admin) async {
    await _db.collection("Admins").doc(admin.id).update(admin.toJson());
  }

}
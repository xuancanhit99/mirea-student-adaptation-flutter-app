import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/authentication/models/admin_model.dart';


class AdminRepository extends GetxController {
  static AdminRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<AdminModel> getAdminDetailsByUidAdminRepo(String uid) async {
    final snapshot = await _db.collection("Admins").doc(uid).get();
    final adminData = AdminModel.fromSnapshot(snapshot);
    return adminData;
  }

  Stream<AdminModel> getAdminDetailsByUidRealtimeAdminRepo(String uid) {
    final snapshot = _db.collection("Admins").doc(uid).snapshots();
    final adminData = snapshot.map((e) => AdminModel.fromSnapshot(e));
    return adminData;
  }


  Future<void> updateAdminRepo(AdminModel admin) async {
    await _db.collection("Admins").doc(admin.id).update(admin.toJson());
  }


  Future<void> updateNewPasswordStudentRepo(String newPassword, String uid) async {
    try {
      await _db.collection("Admins").doc(uid).update({"Password": newPassword});
    } catch (e) {
      print('Error occurred: $e');
    }
  }
}
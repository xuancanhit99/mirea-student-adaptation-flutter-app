import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:msa/src/features/core/models/imo_staff_model.dart';

import '../../features/core/models/imo_contact_model.dart';
// import 'package:path/path.dart' as path;

class IMORepository extends GetxController {
  static IMORepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // Future<IMOStaffModel> getIMOStaffByUid(String uid) async {
  //   final snapshot = await _db.collection("IMOStaff").doc(uid).get();
  //   final imoStaffData = IMOStaffModel.fromSnapshot(snapshot);
  //   return imoStaffData;
  // }

  Stream<IMOStaffModel> getIMOStaffByUidRealtime(String uid) {
    final snapshot = _db.collection("IMOStaff").doc(uid).snapshots();
    final imoStaffData = snapshot.map((e) => IMOStaffModel.fromSnapshot(e));
    return imoStaffData;
  }

  Future<List<IMOStaffModel>> getAllIMOStaffRepo() async {
    final snapshot = await _db.collection("IMOStaff").get();
    final imoStaffData =
    snapshot.docs.map((e) => IMOStaffModel.fromSnapshot(e)).toList();
    return imoStaffData;
  }

  // Future<IMOContactModel> getIMOContactByUid(String uid) async {
  //   final snapshot = await _db.collection("IMOContacts").doc(uid).get();
  //   final imoContactData = IMOContactModel.fromSnapshot(snapshot);
  //   return imoContactData;
  // }

  Stream<IMOContactModel> getIMOContactByUidRealtime(String uid) {
    final snapshot = _db.collection("IMOContacts").doc(uid).snapshots();
    final imoContactData = snapshot.map((e) => IMOContactModel.fromSnapshot(e));
    return imoContactData;
  }

  Future<List<IMOContactModel>> getAllIMOContactRepo() async {
    final snapshot = await _db.collection("IMOContacts").get();
    final imoContactData =
    snapshot.docs.map((e) => IMOContactModel.fromSnapshot(e)).toList();
    return imoContactData;
  }

}

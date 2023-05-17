import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../features/core/models/curator_model.dart';
// import 'package:path/path.dart' as path;

class CuratorRepository extends GetxController {
  static CuratorRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Stream<CuratorModel> getCuratorByUidRealtimeRepo(String uid) {
    final snapshot = _db.collection("Curator").doc(uid).snapshots();
    final curatorData = snapshot.map((e) => CuratorModel.fromSnapshot(e));
    return curatorData;
  }


  Stream<List<CuratorModel>> getAllCuratorRealTimeRepo() {
    final snapshot = _db.collection("Curator").snapshots();
    final curatorListData = snapshot.map((querySnapshot) {
      return querySnapshot.docs
          .map((doc) => CuratorModel.fromSnapshot(doc))
          .toList();
    });
    return curatorListData;
  }


}

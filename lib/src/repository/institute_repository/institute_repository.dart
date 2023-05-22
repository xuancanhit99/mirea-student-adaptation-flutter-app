import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class InstituteRepository extends GetxController {
  static InstituteRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<String>> getListInstituteGroups() async {
    final collectionRef = _db.collection('Institutes');
    final querySnapshot = await collectionRef.get();

    final List<String> groups = [];

    for (var doc in querySnapshot.docs) {
      final data = doc.data();
      final startYear = data['GroupStartYear'];
      final endYear = data['GroupEndYear'];
      final startNo = data['GroupStartNo'];
      final endNo = data['GroupEndNo'];
      for (int year = startYear; year <= endYear; year++) {
        for (int no = startNo; no <= endNo; no++) {
          final groupName = List<String>.from(data["GroupName"]);

          for (int i = 0; i < groupName.length; i++) {
            final groupNo = no.toString().padLeft(2, '0');
            final groupYear = (year % 100).toString().padLeft(2, '0');
            final groupString = '${groupName[i]}-$groupNo-$groupYear';
            groups.add(groupString);
            // print(groupName[i]);
          }
        }
      }
    }
    groups.sort();
    return groups;
  }

  Future<List<String>> getListInstitutesNameRepo() async {
    final collectionRef = _db.collection('Institutes');
    final querySnapshot = await collectionRef.get();

    final List<String> institutes = [];

    for (var doc in querySnapshot.docs) {
      final data = doc.data();
      final instituteName = data['Name'];
      institutes.add(instituteName);
    }
    institutes.sort();
    return institutes;
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class InstituteModel {
  final String? id;
  final String name;
  final List<String> groupName;
  final int groupStartYear;
  final int groupStartNo;
  final int groupEndYear;
  final int groupEndNo;

  const InstituteModel({
    this.id,
    required this.name,
    required this.groupName,
    required this.groupStartNo,
    required this.groupEndNo,
    required this.groupStartYear,
    required this.groupEndYear,
  });

  toJson() {
    return {
      // "Uid" : id,
      "Name": name,
      "GroupName": groupName,
      "GroupStartNo": groupStartNo,
      "GroupEndNo": groupEndNo,
      "GroupStartYear": groupStartYear,
      "GroupEndYear": groupEndYear,
    };
  }

  factory InstituteModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return InstituteModel(
      id: document.id,
      name: data["Name"],
      groupName: List<String>.from(data["GroupName"]),
      groupStartNo: data["GroupStartNo"],
      groupEndNo: data["GroupEndNo"],
      groupStartYear: data["GroupStartYear"],
      groupEndYear: data["GroupEndYear"],
    );
  }
}

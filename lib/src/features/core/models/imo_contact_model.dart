import 'package:cloud_firestore/cloud_firestore.dart';

class IMOContactModel {
  final String? id;
  final String name;
  final String address;
  final String office;
  final String phone;
  final String ext;

  const IMOContactModel({
    this.id,
    required this.name,
    required this.address,
    required this.office,
    required this.phone,
    required this.ext,
  });

  toJson() {
    return {
      "Name": name,
      "Address": address,
      "Office": office,
      "Phone": phone,
      "Ext": ext,
    };
  }

  factory IMOContactModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return IMOContactModel(
      id: document.id,
      name: data["Name"],
      address: data["Address"],
      office: data["Office"],
      phone: data["Phone"],
      ext: data["Ext"],
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class IMOStaffModel {
  final String? id;
  final String fullName;
  final String email;
  final String img;
  final String position;
  final String address;
  final String office;
  final String phone;
  final String ext;

  const IMOStaffModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.img,
    required this.position,
    required this.address,
    required this.office,
    required this.phone,
    required this.ext,
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Image": img,
      "Position": position,
      "Address": address,
      "Office": office,
      "Phone": phone,
      "Ext": ext,
    };
  }

  factory IMOStaffModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return IMOStaffModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      img: data["Image"],
      position: data["Position"],
      address: data["Address"],
      office: data["Office"],
      phone: data["Phone"],
      ext: data["Ext"],
    );
  }
}

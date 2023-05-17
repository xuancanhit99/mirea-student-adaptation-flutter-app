import 'package:cloud_firestore/cloud_firestore.dart';

class CuratorModel {
  final String? id;
  final String fullName;
  final String email;
  final String img;
  final String phone;
  final String telegram;
  final String vk;

  const CuratorModel({
    this.id,
    required this.fullName,
    required this.email,
    required this.img,
    required this.phone,
    required this.telegram,
    required this.vk
  });

  toJson() {
    return {
      "FullName": fullName,
      "Email": email,
      "Image": img,
      "Phone": phone,
      "Telegram": telegram,
      "Vk": vk,
    };
  }

  factory CuratorModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return CuratorModel(
      id: document.id,
      fullName: data["FullName"],
      email: data["Email"],
      img: data["Image"],
      phone: data["Phone"],
      telegram: data["Telegram"],
      vk: data["Vk"],
    );
  }
}

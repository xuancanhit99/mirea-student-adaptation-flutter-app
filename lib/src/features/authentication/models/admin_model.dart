import 'package:cloud_firestore/cloud_firestore.dart';

class AdminModel {
  final String? id;
  final String fullName;
  final String email;
  final String? phoneNo;
  final String password;
  final bool isAdmin;

  const AdminModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    this.phoneNo,
    required this.isAdmin,
  });

  toJson() {
    return {
      // "Uid" : id,
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
      "IsAdmin": isAdmin,
    };
  }

  factory AdminModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return AdminModel(
        id: document.id,
        email: data["Email"],
        password: data["Password"],
        fullName: data["FullName"],
        phoneNo: data["Phone"],
        isAdmin: data["IsAdmin"],
      );
    }
    else {
      return AdminModel(
        id: document.id,
        email: "",
        password: "",
        fullName: "",
        phoneNo: "",
        isAdmin: false,
      );
    }
  }
}

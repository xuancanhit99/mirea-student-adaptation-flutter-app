import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;
  final String password;

  const StudentModel({
    this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {
      // "Uid" : id,
      "FullName": fullName,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  factory StudentModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return StudentModel(
      id: document.id,
        email: data["Email"],
        password: data["Password"],
        fullName: data["FullName"],
        phoneNo: data["Phone"],
    );
  }
}

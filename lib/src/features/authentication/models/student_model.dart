import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String? id;
  final String? no;
  final String fullName;
  final String email;
  final String password;
  final String group;
  final String? phoneNo;
  final String? img;
  final String? dob;
  final String? gender;
  final bool? isActive;
  final bool isAdmin;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const StudentModel({
    this.id,
    this.no,
    required this.fullName,
    required this.email,
    required this.password,
    required this.group,
    this.phoneNo,
    this.img,
    this.dob,
    this.gender,
    this.isActive,
    required this.isAdmin,
    this.createdAt,
    this.updatedAt,
  });

  toJson() {
    return {
      "No": no,
      "FullName": fullName,
      "Email": email,
      "Password": password,
      "Group": group,
      "Phone": phoneNo,
      "Image": img,
      "DOB": dob,
      "Gender": gender,
      "IsActive": isActive,
      "IsAdmin": isAdmin,
      "CreatedAt": createdAt,
      "UpdatedAt": updatedAt,
    };
  }

  factory StudentModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data != null) {
      return StudentModel(
        id: document.id,
        no: data["No"],
        fullName: data["FullName"],
        email: data["Email"],
        password: data["Password"],
        group: data["Group"],
        phoneNo: data["Phone"],
        img: data["Image"],
        dob: data["DOB"],
        gender: data["Gender"],
        isActive: data["IsActive"],
        isAdmin: data["IsAdmin"],
        createdAt: data["CreatedAt"]?.toDate(),
        updatedAt: data["UpdatedAt"]?.toDate(),
      );
    }
    return StudentModel(
      id: document.id,
      no: "",
      fullName: "",
      email: "",
      password: "",
      group: "",
      phoneNo: "",
      img: "",
      dob: "",
      gender: "",
      isActive: false,
      isAdmin: true,
      createdAt: null,
      updatedAt: null,
    );
  }
}

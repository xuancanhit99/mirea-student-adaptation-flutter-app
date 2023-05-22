import 'package:cloud_firestore/cloud_firestore.dart';


class Address {
  final String city;
  final String street;
  final String house;
  final String building;
  final String dormitory;
  final String placeOfBirth;
  final String nationality;

  const Address({
    required this.city,
    required this.street,
    required this.house,
    required this.building,
    required this.dormitory,
    required this.placeOfBirth,
    required this.nationality
  });

  Map<String, dynamic> toJson() {
    return {
      "City": city,
      "Street": street,
      "House": house,
      "Building": building,
      "Dormitory": dormitory,
      "PlaceOfBirth": placeOfBirth,
      "Nationality": nationality
    };
  }

}

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
  final Address address;
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
    required this.address,
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
      "Address": address.toJson(),
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
        address: Address(
          city: data["Address"]["City"],
          street: data["Address"]["Street"],
          house: data["Address"]["House"],
          building: data["Address"]["Building"],
          dormitory: data["Address"]["Dormitory"],
          placeOfBirth: data["Address"]["PlaceOfBirth"],
          nationality: data["Address"]["Nationality"]
        ),
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
      address: const Address(
          city: "",
          street: "",
          house: "",
          building: "",
          dormitory: "",
          placeOfBirth: "",
          nationality: ""
      ),
      isActive: false,
      isAdmin: true,
      createdAt: null,
      updatedAt: null,
    );
  }
}

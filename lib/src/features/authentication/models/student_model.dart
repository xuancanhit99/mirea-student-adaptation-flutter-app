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


class StudyDetails {
  final String yearOfAdmission;
  final String formingDivision;
  final String issuingDivision;
  final String typeOfEducationalProgram;
  final String directionOfTraining;
  final String speciality;
  final String typeOfCostRecovery;
  final String qualificationGiven;
  final String standardDevelopmentPeriod;
  final String formOfLearning;
  final String targetReception;



  const StudyDetails({
    required this.yearOfAdmission,
    required this.formingDivision,
    required this.issuingDivision,
    required this.typeOfEducationalProgram,
    required this.directionOfTraining,
    required this.speciality,
    required this.typeOfCostRecovery,
    required this.qualificationGiven,
    required this.standardDevelopmentPeriod,
    required this.formOfLearning,
    required this.targetReception
  });

  Map<String, dynamic> toJson() {
    return {
      "YearOfAdmission": yearOfAdmission,
      "FormingDivision": formingDivision,
      "IssuingDivision": issuingDivision,
      "TypeOfEducationalProgram": typeOfEducationalProgram,
      "DirectionOfTraining": directionOfTraining,
      "Speciality": speciality,
      "TypeOfCostRecovery": typeOfCostRecovery,
      "QualificationGiven": qualificationGiven,
      "StandardDevelopmentPeriod": standardDevelopmentPeriod,
      "FormOfLearning": formOfLearning,
      "TargetReception": targetReception
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
  final StudyDetails studyDetails;
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
    required this.studyDetails,
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
      "StudyDetails": studyDetails.toJson(),
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
        studyDetails: StudyDetails(
          yearOfAdmission: data["StudyDetails"]["YearOfAdmission"],
          formingDivision: data["StudyDetails"]["FormingDivision"],
          issuingDivision: data["StudyDetails"]["IssuingDivision"],
          typeOfEducationalProgram: data["StudyDetails"]["TypeOfEducationalProgram"],
          directionOfTraining: data["StudyDetails"]["DirectionOfTraining"],
          speciality: data["StudyDetails"]["Speciality"],
          typeOfCostRecovery: data["StudyDetails"]["TypeOfCostRecovery"],
          qualificationGiven: data["StudyDetails"]["QualificationGiven"],
          standardDevelopmentPeriod: data["StudyDetails"]["StandardDevelopmentPeriod"],
          formOfLearning: data["StudyDetails"]["FormOfLearning"],
          targetReception: data["StudyDetails"]["TargetReception"]
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
      studyDetails: const StudyDetails(
          yearOfAdmission: "",
          formingDivision: "",
          issuingDivision: "",
          typeOfEducationalProgram: "",
          directionOfTraining: "",
          speciality: "",
          typeOfCostRecovery: "",
          qualificationGiven: "",
          standardDevelopmentPeriod: "",
          formOfLearning: "",
          targetReception: ""
      ),
      isActive: false,
      isAdmin: true,
      createdAt: null,
      updatedAt: null,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class ExamModel {
  String id;
  String email;
  String firstName;
  String middleName;
  String lastName;
  String dob;
  String gender;
  String height;
  String currentBelt;
  String goingForBelt;
  String status;
  DateTime examDate;

  ExamModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.height,
    required this.currentBelt,
    required this.goingForBelt,
    required this.status,
    required this.examDate,
  });

  // Factory constructor to create from Firestore snapshot
  factory ExamModel.fromSnapshot(DocumentSnapshot doc) {
    // Map Firestore data to FeeTransaction object
    return ExamModel(
      id: doc.get('id') ?? '',
      email: doc.get('email') ?? '',
      firstName: doc.get('firstName') ?? '',
      middleName: doc.get('middleName') ?? '',
      lastName: doc.get('lastName') ?? '',
      dob: doc.get('dob') ?? '',
      gender: doc.get('gender') ?? '',
      height: doc.get('height') ?? '',
      currentBelt: doc.get('currentBelt') ?? '',
      goingForBelt: doc.get('goingForBelt') ?? '',
      status: doc.get('status') ?? 'pending',
      examDate: doc.get('examDate').toDate() ?? DateTime.now(),
    );
  }

  // fromjson method
  factory ExamModel.fromJson(Map<String, dynamic> json) {
    return ExamModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      lastName: json['lastName'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      height: json['height'] ?? '',
      currentBelt: json['currentBelt'] ?? '',
      goingForBelt: json['goingForBelt'] ?? '',
      status: json['status'] ?? 'pending',
      examDate: json['examDate'] ?? DateTime.now(),
    );
  }

  // Convert to Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender,
      'height': height,
      'currentBelt': currentBelt,
      'goingForBelt': goingForBelt,
      'status': status,
      'examDate': examDate,
    };
  }

  @override
  String toString() {
    return '{id: $id, email: $email, firstName: $firstName, middleName: $middleName, lastName: $lastName, dob: $dob, gender: $gender, height: $height, currentBelt: $currentBelt, goingForBelt: $goingForBelt, status: $status ,examDate: $examDate}';
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataModel {
  UserDataModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.dob,
    required this.gender,
    required this.height,
    required this.address,
    required this.parentName,
    required this.dojo,
    required this.bloodGroup,
    required this.optForBus,
    required this.approval,
    required this.beltLevel,
    required this.baseFee,
    required this.examFeeDue,
    required this.incrementPerExam,
    required this.incrementPerYear,
    required this.uniformFeeDue,
    required this.addedFee,
    required this.joiningDate, // Added field
  });

  final String userName;
  final String email;
  final String password;
  final String firstName;
  final String middleName;
  final String lastName;
  final String dob;
  final String gender;
  final String height;
  final String address;
  final String parentName;
  final String dojo;
  final String bloodGroup;
  final String optForBus;
  final bool approval;
  final String beltLevel;
  final String baseFee;
  final double examFeeDue;
  final String incrementPerExam;
  final String incrementPerYear;
  final double uniformFeeDue;
  final double addedFee;
  final String joiningDate;

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      firstName: json['firstName'] ?? '',
      middleName: json['middleName'] ?? '',
      lastName: json['lastName'] ?? '',
      dob: json['dob'] ?? '',
      gender: json['gender'] ?? '',
      height: json['height'] ?? '',
      address: json['address'] ?? '',
      parentName: json['parentName'] ?? '',
      dojo: json['dojo'] ?? '',
      bloodGroup: json['bloodGroup'] ?? '',
      optForBus: json['optForBus'] ?? '',
      approval: json['approval'] ?? false,
      beltLevel: json['beltLevel'] ?? '',
      baseFee: json['baseFee'] ?? '',
      examFeeDue: double.tryParse(json['examFeeDue'].toString()) ?? 0.0,
      incrementPerExam: json['incrementPerExam'] ?? '',
      incrementPerYear: json['incrementPerYear'] ?? '',
      uniformFeeDue: double.tryParse(json['uniformFeeDue'].toString()) ?? 0.0,
      addedFee: double.tryParse(json['addedFee'].toString()) ?? 0.0,
      joiningDate: json['joiningDate'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'dob': dob,
      'gender': gender,
      'height': height,
      'address': address,
      'parentName': parentName,
      'dojo': dojo,
      'bloodGroup': bloodGroup,
      'optForBus': optForBus,
      'approval': approval,
      'beltLevel': beltLevel,
      'baseFee': baseFee,
      'examFeeDue': examFeeDue,
      'incrementPerExam': incrementPerExam,
      'incrementPerYear': incrementPerYear,
      'uniformFeeDue': uniformFeeDue,
      'addedFee': addedFee,
      'joiningDate': joiningDate,
    };
  }
}

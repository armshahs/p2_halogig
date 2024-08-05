import 'package:cloud_firestore/cloud_firestore.dart';

class Holiday {
  final String date;
  final String speciality;

  Holiday({required this.date, required this.speciality});

  factory Holiday.fromSnapshot(DocumentSnapshot doc) {
    return Holiday(
      date: doc.get('date'),
      speciality: doc.get('speciality'),
    );
  }
}

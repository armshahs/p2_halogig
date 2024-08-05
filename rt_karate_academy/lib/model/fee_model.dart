import 'package:cloud_firestore/cloud_firestore.dart';

class FeeTransaction {
  String id;
  String email;
  String username;
  double amount;
  String type;
  String paidTo;
  DateTime date;
  String status;
  List months;

  FeeTransaction({
    required this.id,
    required this.email,
    required this.username,
    required this.amount,
    required this.type,
    required this.paidTo,
    required this.date,
    required this.months,
    this.status = 'pending', // Set default status
  });

  // Factory constructor to create from Firestore snapshot
  factory FeeTransaction.fromSnapshot(DocumentSnapshot doc) {
    // Map Firestore data to FeeTransaction object
    return FeeTransaction(
      id: doc.get('id') ?? '',
      email: doc.get('email') ?? '',
      username: doc.get('username') ?? '',
      amount: double.tryParse(doc.get('amount').toString()) ?? 0.0,
      type: doc.get('type') ?? '',
      paidTo: doc.get('paidTo') ?? '',
      date: doc.get('date').toDate() ?? DateTime.now(),
      status: doc.get('status') ?? 'pending',
      months: doc.get('months') ?? [],
    );
  }

  // Convert to Map for Firestore storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'username': username,
      'amount': amount,
      'type': type,
      'paidTo': paidTo,
      'date': date,
      'status': status,
      'months': months,
    };
  }

  @override
  String toString() {
    return '{id: $id, email: $email, username: $username, amount: $amount, type: $type, paidTo: $paidTo, date: $date, status: $status, months: $months}';
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel {
  OrderModel({
    required this.id,
    required this.username,
    required this.userEmail,
    required this.fitType,
    required this.size,
    required this.price,
    required this.quantity,
    required this.uniformName,
    required this.paymentType,
    required this.paidTo,
    required this.date,
    required this.status,
    required this.paymentStatus,
  });

  final String id;
  final String fitType;
  final String size;
  final String price;
  final String quantity;
  final String username;
  final String userEmail;
  final String uniformName;
  final String paymentType;
  final String paidTo;
  final String status;
  final String paymentStatus;
  final DateTime date;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? '',
      fitType: json['fitType'] ?? '',
      size: json['size'] ?? '',
      price: json['price'] ?? '',
      username: json['username'] ?? '',
      userEmail: json['userEmail'] ?? '',
      quantity: json['quantity'] ?? '',
      uniformName: json['uniformName'] ?? '',
      paymentType: json['paymentType'] ?? '',
      paidTo: json['paidTo'] ?? '',
      status: json['status'] ?? '',
      paymentStatus: json['paymentStatus'] ?? '',
      date: json['date'] ?? '',
    );
  }

  // Factory constructor to create from Firestore snapshot
  factory OrderModel.fromSnapshot(DocumentSnapshot doc) {
    // Map Firestore data to FeeTransaction object
    return OrderModel(
      id: doc.get('id'),
      fitType: doc.get('fitType'),
      size: doc.get('size'),
      price: doc.get('price'),
      username: doc.get('username'),
      userEmail: doc.get('userEmail'),
      quantity: doc.get('quantity'),
      uniformName: doc.get('uniformName'),
      paymentType: doc.get('paymentType'),
      paidTo: doc.get('paidTo'),
      date: doc.get('date').toDate(),
      status: doc.get('status'),
      paymentStatus: doc.get('paymentStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fitType': fitType,
      'size': size,
      'price': price,
      'username': username,
      'userEmail': userEmail,
      'quantity': quantity,
      'uniformName': uniformName,
      'paymentType': paymentType,
      'paidTo': paidTo,
      'status': status,
      'paymentStatus': paymentStatus,
      'date': date,
    };
  }
}

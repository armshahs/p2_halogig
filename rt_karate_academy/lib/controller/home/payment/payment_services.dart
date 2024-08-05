import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../model/fee_model.dart';

class PaymentServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> storeFeeTransaction(
      FeeTransaction transaction, num examAmount, num uniformAmount) async {
    final firestore = FirebaseFirestore.instance;
    // Access the user collection within the class document
    if (transaction.amount > 0) {
      final classCollection = firestore
          .collection('fees')
          .doc("class")
          .collection(getCurrentYear());
      transaction.id = classCollection.doc().id;
      await classCollection.doc(transaction.id).set(transaction.toMap());
    }

    if (uniformAmount > 0) {
      final uniformCollection = firestore
          .collection('fees')
          .doc("uniform")
          .collection("transactions");
      transaction.id = uniformCollection.doc().id;
      transaction.amount = uniformAmount.toDouble();
      await uniformCollection.doc(transaction.id).set(transaction.toMap());
    }

    if (examAmount > 0) {
      final examCollection =
          firestore.collection('fees').doc("exam").collection("transactions");
      transaction.id = examCollection.doc().id;
      transaction.amount = examAmount.toDouble();
      await examCollection.doc(transaction.id).set(transaction.toMap());
    }
  }

  getCurrentMonthAndYear() {
    DateTime now = DateTime.now();
    return '${now.month}-${now.year}';
  }

  getCurrentYear() {
    DateTime now = DateTime.now();
    return '${now.year}';
  }
}

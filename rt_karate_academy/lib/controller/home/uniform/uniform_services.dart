import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rt_karate_academy/model/order_model.dart';

class UniformServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> storeOrderTransaction(OrderModel order) async {
    final firestore = FirebaseFirestore.instance;
    // Access the user collection within the class document
    await firestore
        .collection('orders')
        .doc(_auth.currentUser!.email!.toString())
        .set({"d": "test"});
    final userRef = FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection("Profile")
        .doc(_auth.currentUser!.email!.toString());
    await userRef.update({
      "uniformFeeDue": FieldValue.increment(num.tryParse(order.price) ?? 0)
    });

    final uniformCollection = firestore
        .collection('orders')
        .doc(_auth.currentUser!.email!.toString())
        .collection("uniform");
    // Add the transaction as a new document with a unique ID

    await uniformCollection.add(order.toJson()).then((value) => {
          uniformCollection.doc(value.id).update({"id": value.id})
        });
  }

  Future<List<OrderModel>> getUserOrders() async {
    final firestore = FirebaseFirestore.instance;

    // Access the uniform collection within the user's document
    final uniformCollection = firestore
        .collection('orders')
        .doc(_auth.currentUser!.email!)
        .collection('uniform');

    // Fetch all orders from the collection
    QuerySnapshot ordersSnapshot = await uniformCollection.get();

    print(ordersSnapshot.size);

    // Convert each document snapshot to an Order object
    List<OrderModel> orders =
        ordersSnapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
    print(orders);
    return orders;
  }
}

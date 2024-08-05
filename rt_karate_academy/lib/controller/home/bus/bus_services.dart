import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BusServices {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> insertBusRouteData(Map<String, String> location) async {
    final firestore = FirebaseFirestore.instance;

    // Access the bus collection
    final busCollection = firestore.collection('bus');

    final userDoc = FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(_auth.currentUser!.email!);

    userDoc.set({"optForBus": "Yes"},SetOptions(merge: true));

    // Add a document for the user with email as ID
    await busCollection.doc(_auth.currentUser!.email!).set({
      'location': location,
    });
  }

  Future<void> optOutRouteData() async {
    final userDoc = FirebaseFirestore.instance
        .collection('Academy')
        .doc('Users')
        .collection('Profile')
        .doc(_auth.currentUser!.email!);

    userDoc.set({"optForBus": "No"},SetOptions(merge: true));
  }

  //get bus locations
  Future<List<String>> getLocations() async {
    final firestore = FirebaseFirestore.instance;
    // Fetch bus data from the bus collection
    DocumentSnapshot locationSnapshot =
    await firestore.collection('bus').doc("bus-locations").get();
    // Map bus documents to BusData objects
    List<String> locations = locationSnapshot.get("locations").cast<String>();
    return locations;
  }

}

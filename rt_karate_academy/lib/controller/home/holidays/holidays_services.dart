import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/holidays_model.dart';

class HolidaysServices {
  // Access a reference to the Firestore collection
  final CollectionReference holidaysCollection =
      FirebaseFirestore.instance.collection('holidays');

  Future<List<Holiday>> fetchHolidays() async {
    final QuerySnapshot querySnapshot = await holidaysCollection.get();
    final List<DocumentSnapshot> documents = querySnapshot.docs;

    return documents.map((doc) => Holiday.fromSnapshot(doc)).toList();
  }
}

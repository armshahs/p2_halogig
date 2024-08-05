import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../model/gallary_model.dart';

class GallaryServices {
  final CollectionReference galleryCollection =
      FirebaseFirestore.instance.collection('gallary');

  Future<List<Gallery>> fetchGalleryData() async {
    final QuerySnapshot querySnapshot = await galleryCollection.get();
    final List<DocumentSnapshot> documents = querySnapshot.docs;

    print(documents.map((doc) => Gallery.fromSnapshot(doc)).toList()[0].urls);
    return documents.map((doc) => Gallery.fromSnapshot(doc)).toList();
  }
}

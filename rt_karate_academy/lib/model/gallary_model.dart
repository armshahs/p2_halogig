import 'package:cloud_firestore/cloud_firestore.dart';

class Gallery {
  final String galleryUrlsId;
  final List<String> urls;

  Gallery({required this.galleryUrlsId, required this.urls});

  factory Gallery.fromSnapshot(DocumentSnapshot doc) {
    return Gallery(
      galleryUrlsId: doc.id, // Use the document ID as the galleryUrlsId
      urls: (doc.get('urls') as List<dynamic>).cast<String>(),
    );
  }

  @override
  String toString() {
    return 'GalleryData(galleryUrlsId: $galleryUrlsId, urls: $urls)';
  }

}
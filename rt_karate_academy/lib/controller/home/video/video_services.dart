import 'package:cloud_firestore/cloud_firestore.dart';

class OnlineRevisionServices {
  Future<List<Map<String, dynamic>>> fetchVideoData() async {
    final firestore = FirebaseFirestore.instance;

    // Access the videos collection
    final videosCollection = firestore.collection('videos');

    // Fetch the document with ID "video_urls"
    DocumentSnapshot videoUrlsDoc =
        await videosCollection.doc('video_urls').get();

    // Extract the "urls" array from the document
    List<dynamic> urlsData = videoUrlsDoc.get('urls');

    // Convert each map in the array to a Map<String, dynamic>
    List<Map<String, dynamic>> formattedUrls =
        urlsData.map((map) => Map<String, dynamic>.from(map)).toList();

    return formattedUrls;
  }
}

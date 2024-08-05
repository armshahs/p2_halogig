import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../model/events_model.dart';

class EventsServices {
  Future<List<Event>> getEvents() async {
    final firestore = FirebaseFirestore.instance;

    // Access the events collection
    final eventsCollection = firestore.collection('events');

    // Fetch all events from the collection
    QuerySnapshot eventsSnapshot = await eventsCollection.get();

    // Convert each document snapshot to an Event object
    List<Event> events =
        eventsSnapshot.docs.map((doc) => Event.fromSnapshot(doc)).toList();
    return events;
  }
}

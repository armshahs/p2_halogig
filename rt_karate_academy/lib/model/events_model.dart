// Event model class
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String title;
  String description;
  DateTime date;

  Event({
    required this.title,
    required this.description,
    required this.date,
  });

  // Factory constructor to create from Firestore snapshot
  factory Event.fromSnapshot(DocumentSnapshot doc) {
    // Map Firestore data to Event object
    return Event(
      title: doc.get('title'),
      description: doc.get('description'),
      date: doc.get('time').toDate(),
    );
  }
}
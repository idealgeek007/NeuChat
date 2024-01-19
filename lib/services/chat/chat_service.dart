import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  // get instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // below code listens to user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // Go through each individual user
        final user = doc.data();
        // Return that user
        return user;
      }).toList();
    });
  }

  // get user stream

  // send message

  // get message
}
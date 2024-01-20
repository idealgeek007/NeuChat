import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  Future<void> sendMessage(String receiverID, message) async {
    // get current user info,
    final String currentUserID = _auth.currentUser!.uid;
    final String? currentUserEmail = _auth.currentUser!.email;
    final Timestamp timestamp = Timestamp.now();
    // create a new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    // construct chat room ID for the 2 users

    List<String> ids = [currentUserID, receiverID];
    ids.sort(); // sort the ids(this ensures the chatroomID is the same for 2 people)
    String chatRoomID = ids.join('_');

    // add new message to database
    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

// get message

  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    // construct chat room ID for the 2 users

    List<String> ids = [userID, otherUserID];
    ids.sort(); // sort the ids(this ensures the chatroomID is the same for 2 people)
    String chatRoomID = ids.join('_');

    // add new message to database
    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomID)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}

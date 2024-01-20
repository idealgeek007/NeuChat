import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Sign in
  Future<UserCredential> signInWithEmailAndPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

// Sign out
  Future<void> signOut() async {
    return await _auth.signOut();
  }

  // Sign up

  Future<UserCredential> signUpWithEmailPassword(
      String email, password, name) async {
    try {
      //create User
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // save user info in a sepearate file
      _firestore.collection("Users").doc(userCredential.user?.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
          'name': name,
        },
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<String> getCurrentUserName() async {
    try {
      User? currentUser = getCurrentUser();

      if (currentUser != null) {
        // Fetch user information from Firestore
        DocumentSnapshot userSnapshot =
            await _firestore.collection("Users").doc(currentUser.uid).get();

        // Access the 'name' field in the document
        String userName = userSnapshot['name'] ?? 'Unknown';

        return userName;
      } else {
        // Handle the case where there is no current user
        return 'Unknown';
      }
    } catch (e) {
      // Handle errors, e.g., if the user is not authenticated
      print("Error getting current user's name: $e");
      return 'Unknown';
    }
  }
}

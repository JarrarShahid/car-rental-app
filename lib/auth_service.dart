import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Sign Up User
  Future<User?> signUp(String name, String email, String contact, String password) async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    User? user = userCredential.user;

    if (user != null) {
      await user.updateDisplayName(name); // ✅ Set display name

      // ✅ Save contact number in Firestore
      await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
        'name': name,
        'email': email,
        'contact': contact, // Store contact number
      });

      return user;
    }
  } catch (e) {
    print("Firebase Signup Error: $e");
  }
  return null;
}

  // ✅ Login User
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

  // ✅ Logout User
  Future<void> logout() async {
    await _auth.signOut();
  }

  // ✅ Get Current User
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

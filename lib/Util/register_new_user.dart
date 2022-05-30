import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterNewUser {
  static Future<bool> tryRegisterEMail(String email) async {
    if (!FirebaseAuth.instance.isSignInWithEmailLink("allusers@example.com")) {
      if (!await _login()) {
        return false;
      }
    }

    try {
      final db = FirebaseFirestore.instance.collection("first-challenge-email");
      await db.add({"email": email});
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> _login() async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "allusers@example.com", password: "lösung");

      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return false;
    }
  }
}

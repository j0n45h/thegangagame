import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterNewUser {
  static Future<bool> tryRegisterEMail(String email) async {
    try {
      final db = FirebaseFirestore.instance.collection("first-challenge-email");
      await db.add({"email": email});
      return true;
    }
    catch(e) {
      return false;
    }
  }
}
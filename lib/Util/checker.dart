import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fingerprintjs/fingerprintjs.dart';
import 'package:get_ip_address/get_ip_address.dart';

class Checker {
  static Future<bool> checkIfUserIsNewIp() async {
    final thisIp = await _getIpAddress();
    if (thisIp == "") return false;

    // check DB
    final dbIp = FirebaseFirestore.instance.collection("ip-addresses");
    final ipQueryResult = await dbIp.where("Ip", isEqualTo: thisIp).get();

    if (ipQueryResult.size > 0) return false;

    try {
      // add this Ip to the DB
      await dbIp.add({"Ip": thisIp});
    } catch (error) {
      print("Failed to add Ip [$thisIp] of this User to DB. Error: $error");
      return false;
    }
    return true;
  }

  static Future<String> _getIpAddress() async {
    try {
      final ipAddress = IpAddress(type: RequestType.text);
      dynamic data = await ipAddress.getIpAddress();

      print(data.toString());

      return data.toString();
    } on IpAddressException catch (exception) {
      print(exception.message);
      return "";
    }
  }

  static Future<bool> checkIfUserIsNewFp() async {
    final thisFp = await _getFingerprint();
    if (thisFp == "") return false;

    // check DB
    final dbIp = FirebaseFirestore.instance.collection("fingerprints");
    final ipQueryResult =
        await dbIp.where("fingerprint", isEqualTo: thisFp).get();

    if (ipQueryResult.size > 0) return false;

    try {
      // add this fingerprint to the DB
      await dbIp.add({"fingerprint": thisFp});
    } catch (error) {
      print(
          "Failed to add Fingerprint [$thisFp] of this User to DB. Error: $error");
      return false;
    }
    return true;
  }

  static Future<String> _getFingerprint() async {
    try {
      return await Fingerprint.getHash();
    } catch (e) {
      return "";
    }
  }

  static Future<bool> checkAnswer(String answer) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "allusers@example.com", password: answer);

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

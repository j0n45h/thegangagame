import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class Redirector {
  static Future<bool> linkAvailable() async {
    final dbDiscordUrls = FirebaseFirestore.instance.collection("discord-links");
    final urlQueryResult = await dbDiscordUrls
        .where("expired", isEqualTo: false)
        .get();

    return urlQueryResult.size < 1;
  }

  static Future<bool> tryLoadDiscord() async {
    final dbDiscordUrls = FirebaseFirestore.instance.collection("discord-links");
    final urlQueryResult = await dbDiscordUrls
        .where("expired", isEqualTo: false)
        .get();

    if (urlQueryResult.size < 1) return false;

    final dockId = urlQueryResult.docs.first.id;
    dbDiscordUrls.doc(dockId).update({"expired" : true});

    launch(urlQueryResult.docs.first["url"]);
    return true;
  }
}
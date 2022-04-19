import 'package:cloud_firestore/cloud_firestore.dart';
import "package:nyxx/nyxx.dart";

class LinkGenerator {
  static Future<String> getLink() async {
    final dbDiscordUrls = FirebaseFirestore.instance.collection("discord-bots");
    final acaatura = await dbDiscordUrls.doc("Acaatura").get();

    final token = acaatura["token"].toString();
    final channelId = acaatura["channel-id"].toString();

    // Setup Bot
    final bot = NyxxFactory.createNyxxWebsocket(token, GatewayIntents.allUnprivileged)
      ..registerPlugin(Logging()) // Default logging plugin
      ..registerPlugin(IgnoreExceptions()) // Plugin that handles uncaught exceptions that may occur
      ..connect();

    final inviteEvent = bot.eventsWs.onInviteCreated.first;

    // Generate Link when connected
    bot.eventsWs.onReady.listen((IReadyEvent e) async {
      final channel = await bot.fetchChannel(Snowflake(channelId));
      final link = await (channel as ITextGuildChannel).createInvite(maxUses: 1, unique: true, temporary: false, maxAge: 0);

      print("Created Link: " + link.url);
    });

    // Get Link from Event
    return (await inviteEvent).invite.url;
  }
}
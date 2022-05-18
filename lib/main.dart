import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thegangagame/Screens/FirstQuiz/first_quiz.dart';
import 'package:thegangagame/Screens/Mail/mail_screen.dart';
import 'package:thegangagame/Screens/MessageScreen/message_screen.dart';
import 'package:thegangagame/Screens/ThirdQuiz/third_quiz.dart';
import 'package:thegangagame/Screens/Video/video_screen.dart';
import 'package:thegangagame/Screens/redirect_screen.dart';
import 'package:thegangagame/Util/quiz_tracker.dart';
import 'Screens/Mail/mail.dart';

import 'Screens/SecondQuiz/second_quiz.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:thegangagame/Screens/quiz_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );

  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizTracker()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MailScreen.routeName,
        routes: {
          VideoScreen.routeName: (_) => const VideoScreen(),
          MessageScreen.routeName: (_) => const MessageScreen(),
          FirstQuiz.routeName: (_) => const FirstQuiz(),
          SecondQuiz.routeName: (_) => const SecondQuiz(),
          ThirdQuiz.routeName: (_) => const ThirdQuiz(),
          //QuizScreen.routeName: (_) => const QuizScreen(),
          RedirectScreen.routeName: (_) => const RedirectScreen(),
          
          MailScreen.routeName: (_) => const MailScreen(),
        },
      ),
    );
  }
}

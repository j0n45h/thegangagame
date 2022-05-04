import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thegangagame/Screens/FirstQuiz/first_quiz.dart';
import 'package:thegangagame/Screens/MessageScreen/message_screen.dart';
import 'package:thegangagame/Screens/ThirdQuiz/third_quiz.dart';
import 'package:thegangagame/Screens/Video/video_screen.dart';
import 'package:thegangagame/Screens/redirect_screen.dart';
import 'Screens/SecondQuiz/second_quiz.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:thegangagame/Screens/quiz_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = const Settings(
    persistenceEnabled: false,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: VideoScreen.routeName,
      routes: {
        VideoScreen.routeName: (_) => const VideoScreen(),
        MessageScreen.routeName: (_) => const MessageScreen(),
        FirstQuiz.routeName: (_) => const FirstQuiz(),
        SecondQuiz.routeName: (_) => const SecondQuiz(),
        ThirdQuiz.routeName: (_) => const ThirdQuiz(),
        //QuizScreen.routeName: (_) => const QuizScreen(),
        RedirectScreen.routeName: (_) => const RedirectScreen(),
      },
    );
  }
}

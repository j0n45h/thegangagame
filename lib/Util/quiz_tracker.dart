import 'package:flutter/foundation.dart';

class QuizTracker with ChangeNotifier, DiagnosticableTreeMixin {
  QuizState state = QuizState.None;
}

enum QuizState {
  None,
  First,
  Second,
  Third,
}
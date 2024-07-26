import 'package:flutter/material.dart';
import 'package:myapp/screens/quiz_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])  //lock orientation
      .then((fn) {
    runApp(const QuizScreen());
  });
}

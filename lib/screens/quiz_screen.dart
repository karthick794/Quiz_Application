import 'package:flutter/material.dart';
import 'package:myapp/data/questions_data.dart';
import 'package:myapp/screens/questions_screen.dart';
import 'package:myapp/screens/quiz_result_screen.dart';
import 'package:myapp/screens/quiz_start_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = "quizStartScreen";

  // @override
  // void initState() {
  //   activeScreen = QuizStartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = "questionScreen";
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questionsData.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = "quizResultScreen";
      });
    }
  }
  void restartQuizScreen()
  {
    setState(() {
      selectedAnswers = [];
      activeScreen = "quizStartScreen";
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = QuizStartScreen(switchScreen);
    if (activeScreen == "questionScreen") {
      screenWidget = QuestionsScreen(onselectAnswer: chooseAnswer);
    }
    if (activeScreen == "quizResultScreen") {
      screenWidget =  QuizResultScreen(chosenAnswer: selectedAnswers,restartQuizScreen: restartQuizScreen,);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color.fromARGB(125, 252, 852, 142),
            Color.fromARGB(123, 48, 165, 191)
          ], begin: Alignment.topRight, end: Alignment.bottomRight)),
          child: screenWidget, //if condition
          // child: activeScreen == "quizStartScreen"
          //     ? QuizStartScreen(switchScreen)
          //     : const QuestionsScreen(), // Ternary Operator
        ),
      ),
    );
  }
}

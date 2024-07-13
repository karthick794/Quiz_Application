import 'package:flutter/material.dart';
import 'package:myapp/data/questions_data.dart';
import 'package:myapp/widgets/option_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onselectAnswer});
  final void Function(String answer) onselectAnswer;
  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void nextQuestion(String answer) {
    widget.onselectAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestions = questionsData[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestions.questions,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 25,
            ),
            ...currentQuestions.options.map((element) {
              return OptionButton(
                  options: element,
                  next: () {
                    nextQuestion(element);
                  });
            })
          ],
        )),
      ),
    );
  }
}

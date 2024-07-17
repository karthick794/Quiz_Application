import 'package:flutter/material.dart';

class QuestionIndentifier extends StatelessWidget {
  const QuestionIndentifier(
      {super.key, required this.questionIndex, required this.correctAnswer});
  final String questionIndex;
  final bool correctAnswer;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: correctAnswer ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          questionIndex,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

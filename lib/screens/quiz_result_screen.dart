import 'package:flutter/material.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize:MainAxisSize.max,
          children: [
            Text("Here your result")
          ],
        ),
      ),
    );
  }
}
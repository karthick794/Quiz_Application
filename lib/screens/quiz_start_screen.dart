import 'package:flutter/material.dart';
import 'package:myapp/utilites/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizStartScreen extends StatelessWidget {
  const QuizStartScreen(this.startquiz,{super.key});
  final void Function() startquiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(255, 27, 181, 192),
          ),
          const SizedBox(
            height: 30,
          ),
           Text(
            Constants.tagLine,
            style: GoogleFonts.lato(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          OutlinedButton.icon(
              onPressed: 
               startquiz,
              icon: const Icon(
                Icons.arrow_forward,
                color: Color.fromARGB(255, 35, 105, 185),
              ),
              label: const Text(
                Constants.startQuiz,
                style: TextStyle(color: Color.fromARGB(255, 35, 105, 185)),
              ))
        ],
      ),
    );
  }
}

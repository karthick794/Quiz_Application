import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/questions_data.dart';
import 'package:myapp/widgets/result_summary.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen(
      {super.key, required this.chosenAnswer, required this.restartQuizScreen});
  final List<String> chosenAnswer;
  final void Function() restartQuizScreen;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questionsData[i].questions,
        "correct_answer": questionsData[i].options[0],
        "user_answer": chosenAnswer[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumberOfQuestions = summaryData.length;
    final correctNumberOfQuestions = summaryData.where((element) {
      return element['correct_answer'] == element['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Your correct answer is $correctNumberOfQuestions out of $totalNumberOfQuestions questions",
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ResultSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: restartQuizScreen,
              icon: const Icon(
                Icons.loop,
                color: Colors.black,
              ),
              label: const Text("Restart Quiz"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

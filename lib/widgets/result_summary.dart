import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/widgets/question_identifier.dart';

class ResultSummary extends StatelessWidget {
  const ResultSummary({super.key, required this.summaryData});
  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionIndentifier(
                  questionIndex:
                      ((data['question_index'] as int) + 1).toString(),
                  correctAnswer: data['correct_answer'] == data['user_answer']
                      ? true
                      : false,
                ),
                // Text(
                //   ((data['question_index'] as int) + 1).toString(),
                //   style: TextStyle(
                //       backgroundColor: data['user_answer'] == data['correct_answer']
                //           ? Colors.green
                //           : Colors.red,
                //       fontSize: 16),
                // ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['correct_answer'] as String,
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        data['user_answer'] as String,
                        style: TextStyle(
                            color: data['user_answer'] == data['correct_answer']
                                ? Colors.green
                                : Colors.red,
                            fontSize: 16),
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}

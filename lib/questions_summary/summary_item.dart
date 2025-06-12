import 'package:adv_basis/questions_summary/question_indentifier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final CrossAxisAlignment crossStart = CrossAxisAlignment.start;
final MainAxisAlignment mainStart = MainAxisAlignment.start;

class SummmaryItem extends StatelessWidget {
  const SummmaryItem({super.key, required this.summaryData});
  final Map<String, Object> summaryData;

  @override
  Widget build(BuildContext context) {
    final isCorrectQuestion =
        summaryData['user_answer'] == summaryData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        crossAxisAlignment: crossStart,
        // mainAxisAlignment: mainStart,
        children: [
          QuestionIndentifier(
            questionIndex: summaryData['question_index'] as int,
            checkCorrectQuestion: isCorrectQuestion,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: crossStart,
              // mainAxisAlignment: mainStart,
              children: [
                Text(
                  summaryData['question'] as String,
                  style: GoogleFonts.lato(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  summaryData['user_answer'] as String,
                  style: GoogleFonts.lato(
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 229, 179, 238),
                  ),
                ),
                Text(
                  summaryData['correct_answer'] as String,
                  style: GoogleFonts.lato(
                    fontSize: 14.0,
                    color: const Color.fromARGB(255, 184, 188, 248),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

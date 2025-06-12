import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIndentifier extends StatelessWidget {
  const QuestionIndentifier({
    super.key,
    required this.questionIndex,
    required this.checkCorrectQuestion,
  });

  final int questionIndex;
  final bool checkCorrectQuestion;

  @override
  Widget build(BuildContext context) {
    final currentIndex = questionIndex + 1;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 24.0, 0),
      child: CircleAvatar(
        maxRadius: 16,
        backgroundColor: checkCorrectQuestion
            ? Colors.lightBlue
            : Colors.purpleAccent,
        child: Center(
          child: Text(
            (currentIndex).toString(),
            style: GoogleFonts.lato(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

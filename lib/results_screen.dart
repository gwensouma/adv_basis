import 'dart:math';

import 'package:adv_basis/models/quiz_question.dart';
import 'package:adv_basis/questions_summary/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
    this.resetQuiz, {
    super.key,
    required this.list,
    required this.choosenAnswer,
  });

  final List<QuizQuestion> list;
  final List<String> choosenAnswer;
  final void Function() resetQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < choosenAnswer.length; i++) {
      // final correctAnswer = list[i].answers.where((answer) => answer.correct);

      List<String> correctAnswers = list[i].answers
          .where((answer) => answer.correct)
          .map((e) => e.answer)
          .toList();

      final isCorrect = correctAnswers
          .where((e) => e == choosenAnswer[i])
          .isNotEmpty;

      print(isCorrect);

      summary.add({
        'question_index': i,
        'question': list[i].question,
        'correct_answer': correctAnswers,
        'user_answer': choosenAnswer[i],
        'is_correct': isCorrect,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestion = list.length;
    final numCorrectQuestion = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 225, 173, 234),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              icon: Icon(
                Icons.replay_outlined,
                color: Colors.greenAccent,
                size: 24.0,
              ),
              onPressed: resetQuiz,
              label: Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.greenAccent, fontSize: 24.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:adv_basis/answer_button.dart';
import 'package:adv_basis/models/quiz_question.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(
    List<QuizQuestion> listShuffled,
    String answer,
    bool isNext,
  )
  onSelectedAnswer;

  @override
  State<QuestionScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionScreen> {
  Random random = Random();

  var currentQuestionIndex = 0;
  List<QuizQuestion> questionShuffled = [];

  late Future<List<QuizQuestion>> _futureQuestions;

  bool _hasLoadedQuestions = false;

  @override
  void initState() {
    super.initState();
    _futureQuestions = loadQuestions();
    print('fetched questions');
  }

  void nextQuestion(String selectedAnswer) {
    final bool isLastQuestion =
        currentQuestionIndex >= questionShuffled.length - 1;

    widget.onSelectedAnswer(questionShuffled, selectedAnswer, isLastQuestion);

    if (!isLastQuestion) {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  FutureBuilder<List<QuizQuestion>> buildListQuestion() {
    return FutureBuilder(
      future: _futureQuestions,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("error fetching");
        } else if (snapshot.hasData) {
          final data = snapshot.data!;

          if (!_hasLoadedQuestions) {
            questionShuffled = List.from(data);
            _hasLoadedQuestions = true;
          }

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data[currentQuestionIndex].question,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ...data[currentQuestionIndex].getShuffledAnswer().map((answer) {
                return AnswerButton(
                  onTap: () {
                    nextQuestion(answer);
                  },
                  answerText: answer,
                );
              }),
            ],
          );
        }

        return Text("no data");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: buildListQuestion(),
      ),
    );
  }
}

Future<String> _loadQuestionsAsset() async {
  return await rootBundle.loadString('assets/data/questions.json');
}

Future<List<QuizQuestion>> loadQuestions() async {
  String jsonString = await _loadQuestionsAsset();
  final List<dynamic> jsonResponse = json.decode(jsonString);

  List<QuizQuestion> raw = jsonResponse
      .map((item) => QuizQuestion.fromJson(item))
      .toList();

  List<QuizQuestion> temp = List.of(raw);
  temp.shuffle();

  return temp;
}

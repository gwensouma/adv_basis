import 'package:adv_basis/models/quiz_question.dart';
import 'package:adv_basis/questions_screen.dart';
import 'package:adv_basis/results_screen.dart';
import 'package:adv_basis/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<QuizQuestion> _shuffledList = [];
  List<String> selectAnswers = [];

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
      _shuffledList = [];
      selectAnswers = [];
    });
  }

  void chooseAnswer(
    List<QuizQuestion> shuffledList,
    String answer,
    bool isLastQuestion,
  ) {
    if (_shuffledList.isEmpty) {
      _shuffledList = List.from(shuffledList);
    }

    selectAnswers.add(answer);

    if (isLastQuestion) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void backStartScreen() {
    setState(() {
      selectAnswers = [];
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionScreen(onSelectedAnswer: chooseAnswer);
    }

    if (activeScreen == 'result-screen') {
      screenWidget = ResultsScreen(
        list: _shuffledList,
        backStartScreen,
        choosenAnswer: selectAnswers,
      );
    }

    return MaterialApp(
      title: 'ADV_BASIS',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}

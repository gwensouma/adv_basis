import 'package:json_annotation/json_annotation.dart';

part 'quiz_question.g.dart';

@JsonSerializable()
class QuizAnswer {
  final String answer;
  final bool correct;

  QuizAnswer({required this.answer, required this.correct});

  factory QuizAnswer.fromJson(Map<String, dynamic> json) =>
      _$QuizAnswerFromJson(json);

  Map<String, dynamic> toJson() => _$QuizAnswerToJson(this);
}

@JsonSerializable()
class QuizQuestion {
  final String question;
  final List<QuizAnswer> answers;

  QuizQuestion({required this.question, required this.answers});

  factory QuizQuestion.fromJson(Map<String, dynamic> json) =>
      _$QuizQuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuizQuestionToJson(this);

  List<String> getShuffledAnswer() {
    return answers.map((e) => e.answer).toList()..shuffle();
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizAnswer _$QuizAnswerFromJson(Map<String, dynamic> json) => QuizAnswer(
  answer: json['answer'] as String,
  correct: json['correct'] as bool,
);

Map<String, dynamic> _$QuizAnswerToJson(QuizAnswer instance) =>
    <String, dynamic>{'answer': instance.answer, 'correct': instance.correct};

QuizQuestion _$QuizQuestionFromJson(Map<String, dynamic> json) => QuizQuestion(
  question: json['question'] as String,
  answers: (json['answers'] as List<dynamic>)
      .map((e) => QuizAnswer.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuizQuestionToJson(QuizQuestion instance) =>
    <String, dynamic>{
      'question': instance.question,
      'answers': instance.answers,
    };

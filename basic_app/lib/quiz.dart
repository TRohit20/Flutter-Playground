import 'package:basic_app/question.dart';
import 'package:flutter/material.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionNumber;
  final Function count;

  const Quiz(
      {super.key,
      required this.questionNumber,
      required this.questions,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionNumber]['questionText'] as String),
        // Transform list of maps to widgets so the options can be dynamic
        ...(questions[questionNumber]['options'] as List<Map<String, Object>>)
            .map((option) {
          return Answer(() => count(option['score']), option['text'] as String);
        }).toList()
      ],
    );
  }
}

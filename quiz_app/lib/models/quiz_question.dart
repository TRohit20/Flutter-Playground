import 'package:flutter/material.dart';

class QuizQuestion {
  final String questions;
  final List<String> answers;

  const QuizQuestion(this.questions, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledList = List.of(answers);
    shuffledList.shuffle();
    return shuffledList;
  }
}

import './quiz.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/data/dummy_questions.dart';
import 'package:quiz_app/summary_data.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnswers;
  final void Function() onRestart;

  const ResultsScreen(
      {super.key, required this.selectedAnswers, required this.onRestart});

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summaryData = [];

    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question-index': i,
        'question': questions[i].questions,
        'correct-answer': questions[i].answers[0],
        'user-answer': selectedAnswers[i]
      });
    }

    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalNumberOfQuestions = questions.length;
    final correctAnswers = summaryData.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You answered $correctAnswers questions out of $totalNumberOfQuestions correctly!',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SummaryData(summaryData),
                TextButton.icon(
                  onPressed: onRestart,
                  icon: const Icon(Icons.refresh),
                  style: TextButton.styleFrom(foregroundColor: Colors.white),
                  label: const Text('Restart Quiz'),
                )
              ],
            )));
  }
}

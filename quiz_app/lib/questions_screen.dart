import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/dummy_questions.dart';

class QuestionsScreen extends StatefulWidget {
  final void Function(String answer) onAnswerSelected;
  const QuestionsScreen(this.onAnswerSelected, {super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void updateQuestion(String selectedAnswer) {
    widget.onAnswerSelected(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.questions,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            ...question.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  option: answer, onTap: () => updateQuestion(answer));
            })
          ],
        ),
      ),
    );
  }
}

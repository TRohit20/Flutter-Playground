import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/questions_identifier.dart';

class SummaryItem extends StatelessWidget {
  final Map<String, Object> itemData;

  const SummaryItem(this.itemData, {super.key});

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user-answer'] == itemData['correct-answer'];

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
            isCorrectAnswer, (itemData['question-index']) as int),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              (itemData['question']) as String,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text((itemData['user_answer']) as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 202, 171, 252),
                )),
            Text((itemData['correct_answer']) as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246),
                )),
          ],
        ))
      ],
    );
  }
}

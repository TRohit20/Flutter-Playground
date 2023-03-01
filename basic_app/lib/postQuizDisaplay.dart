import 'dart:ffi';

import 'package:flutter/material.dart';

class PostQuizDisplay extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;

  const PostQuizDisplay(this.totalScore, this.resetQuiz, {super.key});

  String get completionPhrase {
    var phrase = "'Wow, You answered all the questions!'";
    if (totalScore > 10) {
      phrase = "You are awesome";
    } else if (totalScore > 20) {
      phrase = "You are a genius";
    } else {
      phrase = "Great job!";
    }
    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(10)),
            child: Text(
              completionPhrase,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        ElevatedButton(
            onPressed: resetQuiz,
            child: const Text(
              'Reset',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  final Function startQuiz;

  const StartScreen(this.startQuiz, {super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize:
          MainAxisSize.min, // To take minimum size and center the image
      children: [
        Image.asset(
          'assets/images/logo.png',
          width: 300,
          // color: Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Learn Flutter the FUN way!',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: 20),
        OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'))
      ],
    ));
  }
}

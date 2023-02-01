import 'package:flutter/material.dart';
// import 'main.dart';

class Question extends StatelessWidget {
  //Final keyword is used in order to ensure that the variable cannot be changed internally.
  final String question;

  // Creating a constructor with positional argument to take external data
  // Syntax: Class_name()
  Question(this.question);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      child: Text(
        question,
        style: TextStyle(fontSize: 30, color: Colors.blue),
        textAlign: TextAlign.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Another way to do it would be: A way to write func when theres only one expression to execute
// void main() => runApp(MyApp());

// Create the main App widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    var questions = ['What\'s your name?', 'What\'s your age?'];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
          backgroundColor: Colors.red,
        ),
        body: Column(
          children: [
            Text('Here are a Quick Question:'),
            Text('What type of Programming language is Dart?'),
            ElevatedButton(
              child: Text('It is a Object-Oriented Programming Language!'),
              onPressed: null,
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('It is loosely typed Programming Language.'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('It is a dynamic programming language.'),
            ),
          ],
        ),
      ),
    );
  }
}

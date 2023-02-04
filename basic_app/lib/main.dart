import 'package:flutter/material.dart';
import './question.dart';
import './test.dart';

void main() {
  runApp(MyApp());
}

// Another way to do it would be: A way to write func when theres only one expression to execute
// void main() => runApp(MyApp());

// Create the main App widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionNumber = 0;
  var questions = [
    'Which is your Favourite?',
    'Which do you think is easier?',
  ];

  void _count() {
    // setState method takes a anonymous function as the parameter
    setState(() {
      _questionNumber += 1;
    });
    // questionNumber += 1;
    print(_questionNumber);
  }

  @override
  Widget build(BuildContext context) {
    setTest();
    mapsTest();
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
            backgroundColor: Colors.red,
          ),
          body: Column(
            children: [
              Question(questions[_questionNumber]),
              ElevatedButton(onPressed: _count, child: Text('Java')),
              // Text(questions[questionNumber]),
              ElevatedButton(onPressed: _count, child: Text('Python')),
              // Text(questions[questionNumber]),
              ElevatedButton(
                  onPressed: () => print('Answer Chosen'), child: Text('C++')),
            ],
          )),
    );
  }
}

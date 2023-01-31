import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Another way to do it would be: A way to write func when theres only one expression to execute
// void main() => runApp(MyApp());

// Create the main App widget
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  var questionNumber = 0;
  var questions = [
    'Which is your Favourite?',
    'Which do you think is easier?',
  ];

  void count() {
    // setState method takes a anonymous function as the parameter
    setState(() {
      questionNumber += 1;
    });
    // questionNumber += 1;
    print(questionNumber);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First App'),
            backgroundColor: Colors.red,
          ),
          body: Column(
            children: [
              Text(questions[questionNumber]),
              ElevatedButton(onPressed: count, child: Text('Java')),
              // Text(questions[questionNumber]),
              ElevatedButton(onPressed: count, child: Text('Python')),
              // Text(questions[questionNumber]),
              ElevatedButton(
                  onPressed: () => print('Answer Chosen'), child: Text('C++')),
            ],
          )),
    );
  }
}

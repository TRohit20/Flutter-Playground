import 'package:basic_app/OOPs/inheritance/customHouse.dart';
import 'package:basic_app/OOPs/inheritance/house.dart';
import 'package:basic_app/postQuizDisaplay.dart';
import 'package:basic_app/quiz.dart';
import 'package:flutter/material.dart';
import './question.dart';
// import './test.dart';
import 'OOPs/object_oriented.dart';
import 'enums_example.dart';
import 'asynchronous.dart';
import 'answer.dart';

void main() {
  runApp(const MyApp());
}

// Another way to do it would be: A way to write func when theres only one expression to execute
// void main() => runApp(MyApp());

// Create the main App widget
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  var _questionNumber = 0;
  int _totalScore = 0;
  // Maps
  var questions = [
    {
      'questionText': 'Which is your favourite language?',
      'options': [
        {'text': 'python', 'score': 10},
        {'text': 'Java', 'score': 8},
        {'text': 'Dart', 'score': 5}
      ]
    },
    {
      'questionText': 'Which do you think is easier?',
      'options': [
        {'text': 'python', 'score': 10},
        {'text': 'Java', 'score': 8},
        {'text': 'C++', 'score': 3},
        {'text': 'Dart', 'score': 5}
      ]
    }
  ];

  void _count(int score) {
    _totalScore += score;
    // setState method takes a anonymous function as the parameter
    setState(() {
      _questionNumber += 1;
    });
    // questionNumber += 1;
    print(_questionNumber);
  }

  List<String>? naam = ['Karthik'];
  Employee rohit = Employee(
    'Rohit',
    1957,
    100,
    phoneNumber: 999,
    address: 'Hey this is the X employee\'s address ',
  );

  CustomHouse h2 = CustomHouse(10, 12, 14, 4);

  House h1 = House(123, 123, 14431);

  void switchExample(Week week) {
    switch (week) {
      case Week.monday:
        print('People usually hate mondays for some reason');
        break;
      case Week.tuesday:
        print('Tuesdays are weird AF');
        break;
      case Week.sunday:
        print('Absolute best days');
        return;
      case Week.wednesday:
        break;
      case Week.thursday:
        break;
      case Week.friday:
        break;
      case Week.saturday:
        break;
    }
  }

// Await and Async
  void example() async {
    await for (var value in getNumbers()) {
      print(value);
    }
    print('Stream is now closed');
  }

  @override
  Widget build(BuildContext context) {
    print(syncGenerator());
    for (final value in syncGenerator()) {
      if (value > 0) {
        print(value);
      }
    }
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My First App'),
            backgroundColor: Colors.red,
          ),
          body: _questionNumber < questions.length
              ? Quiz(
                  questionNumber: _questionNumber,
                  questions: questions,
                  count: _count)
              : PostQuizDisplay(_totalScore)),
    );
  }
}

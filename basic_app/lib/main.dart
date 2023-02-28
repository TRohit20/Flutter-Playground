import 'package:basic_app/OOPs/inheritance/customHouse.dart';
import 'package:basic_app/OOPs/inheritance/house.dart';
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
  // Maps
  var questions = [
    {
      'questionText': 'Which is your favourite language?',
      'options': ['python', 'Java', 'Dart']
    },
    {
      'questionText': 'Which do you think is easier?',
      'options': ['Python', 'Java', 'C++', 'Dart']
    }
  ];

  void _count() {
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
              ? Column(
                  children: [
                    Question(
                        questions[_questionNumber]['questionText'] as String),
                    // Transform list of maps to widgets so the options can be dynamic
                    ...(questions[_questionNumber]['options'] as List<String>)
                        .map((option) {
                      return Answer(_count, option);
                    }).toList()
                  ],
                )
              : Center(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          const Text('Wow, You answered all the questions!')),
                )),
    );
  }
}

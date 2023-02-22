import 'package:basic_app/OOPs/inheritance/customHouse.dart';
import 'package:basic_app/OOPs/inheritance/house.dart';
import 'package:flutter/material.dart';
import './question.dart';
// import './test.dart';
import 'OOPs/object_oriented.dart';
import 'enums_example.dart';
import 'asynchronous.dart';

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

  List<String>? naam = ['Karthik'];
  Employee rohit = Employee(
    'Rohit',
    1957,
    100,
    phoneNumber: 999,
    address: 'Hey this is the X employee\'s address ',
  );

  CustomHouse h2 = new CustomHouse(10, 12, 14, 4);

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
    example();
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

import 'package:flutter/material.dart';
import './gradient_container.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text('Roll Dice App'),
        //   backgroundColor: ,
        // ),
        backgroundColor: Color.fromARGB(255, 47, 5, 120),
        body: GradientContainer([
          Color.fromARGB(255, 90, 8, 232),
          Color.fromARGB(255, 60, 12, 144)
        ]),
      ),
    );
  }
}

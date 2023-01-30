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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First App'),
          backgroundColor: Colors.red,
        ),
        body: Text('This is my first test'),
      ),
    );
  }
}

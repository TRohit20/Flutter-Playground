import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ziggy Recipes',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: CategoriesScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Ziggy',
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      body: Center(
        child: Text('This is the Home Page'),
      ),
    );
  }
}

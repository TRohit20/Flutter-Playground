import 'package:flutter/material.dart';
import 'package:ziggy_a_recipes_app/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ziggy Recipes',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        // colorScheme:
        //     ColorScheme.fromSwatch(accentColor: Colors.deepOrange.shade200),
        canvasColor: const Color.fromRGBO(255, 254, 230, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyLarge: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            bodyMedium: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            titleLarge:
                const TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20),
            titleMedium: const TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ),
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // We build using a the cupertino app
    return const CupertinoApp(
      // Then we use the cupertino theme to draw on different properties
      theme: CupertinoThemeData(brightness: Brightness.dark),
      // Creating a Home Page

      home: CupertinoHomePage(),
    );
  }
}

class CupertinoHomePage extends StatefulWidget {
  const CupertinoHomePage({super.key});

  @override
  _CupertinoHomePageState createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  @override
  Widget build(BuildContext context) {
    // We use Cupertino Scaffold
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Chat App'),
        ),
        child: Center(
          child: Text('Hello there!'),
        ));
  }
}

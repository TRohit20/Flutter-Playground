import 'package:flutter/material.dart';
import 'package:shopping_list_app/widgets/grocery_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Shopping List',
        theme: ThemeData.dark().copyWith(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.dark,
                seedColor: const Color.fromARGB(181, 12, 212, 243),
                surface: const Color.fromARGB(255, 42, 51, 59)),
            scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60)),
        home: const GroceryList());
  }
}

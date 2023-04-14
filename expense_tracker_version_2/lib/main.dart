import 'package:flutter/material.dart';
import './widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: Color.fromARGB(238, 11, 194, 185));
void main() {
  runApp(MaterialApp(
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          elevation: 15,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: kColorScheme.primaryContainer,
        )),
        textTheme: const TextTheme().copyWith(
            titleLarge: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black),
            bodyMedium: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 12,
                color: Colors.grey.shade800))),
    home: const Expenses(),
  ));
}

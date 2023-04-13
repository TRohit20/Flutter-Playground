import 'package:flutter/material.dart';
import './widgets/expenses.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(useMaterial3: true),
    home: Expenses(),
  ));
}

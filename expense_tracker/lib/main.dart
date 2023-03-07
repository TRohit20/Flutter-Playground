import 'package:flutter/material.dart';
import './transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({super.key});

  final List<Transactions> transactions = [
    Transactions(amount: 70000, date: DateTime.now(), title: 'New Shoes'),
    Transactions(amount: 35000, date: DateTime.now(), title: 'New Watch')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              elevation: 10,
              child: Container(
                  width: 300, color: Colors.amber, child: Text('Charts')),
            ),
          ),
          const Card(
            elevation: 15,
            child: Text('List of transactions'),
          )
        ],
      ),
    );
  }
}

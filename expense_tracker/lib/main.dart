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
        backgroundColor: Colors.green,
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
          Column(
            // Using .map to transform objs to list of widgets and we use .list cz .map outputs iterables.
            children: transactions.map((tx) {
              return Card(
                // Using Columns inside rows and both inside a card
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(15),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 2)),
                      child: Text(
                        tx.amount.toString(),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tx.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          tx.date.toString(),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

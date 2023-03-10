import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;

  // Using constructor to pass data from parent to child
  // Using this to pass the transactions data
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    // return Container(
    //   height: 500,
    //   child: SingleChildScrollView(
    //     child: Column(
    return Column(
      // Using .map to transform objs to list of widgets and we use .list cz .map outputs iterables.
      children: transactions.map((tx) {
        return Card(
          color: Colors.green[200],
          // Using Columns inside rows and both inside a card
          child: Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red, width: 2)),
                child: Text(
                  // In interpolation, when you are not just using a variable, but calling a property or more, then {} are used to wrap that expression
                  '\$ ${tx.amount}',
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
                    // DateFormat('dd-MM-yyyy').format(tx.date),
                    DateFormat.yMMMd().format(tx.date),
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  )
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}

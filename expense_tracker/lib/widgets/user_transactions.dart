import 'package:flutter/material.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transactions_list.dart';
import '../models/transactions.dart';

class UserTransactions extends StatefulWidget {
  // const MyWidget({super.key});

  @override
  State<UserTransactions> createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transactions> _userTransactions = [
    Transactions(amount: 300, date: DateTime.now(), title: 'New Shoes'),
    Transactions(amount: 700, date: DateTime.now(), title: 'New Watch')
  ];

  void _addingNewTransaction(String title, double amount) {
    final newTransaction =
        Transactions(amount: amount, date: DateTime.now(), title: title);

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addingNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}

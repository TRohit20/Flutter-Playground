import 'package:expense_tracker/widgets/user_transactions.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // Saving the input per every key stroke
  final transactionTitle = TextEditingController();
  final transactionAmount = TextEditingController();

  final Function newTransaction;

  NewTransaction(this.newTransaction);

  void submitData() {
    final enteredTitle = transactionTitle.text;
    final enteredAmount = double.parse(transactionAmount.text);

    // Covering edge case or Check
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    newTransaction(transactionTitle.text, double.parse(transactionAmount.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: <Widget>[
            TextField(
              decoration: const InputDecoration(labelText: 'Name of expense'),
              controller: transactionTitle,
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => transactionTitle = value,),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Amount'),
              controller: transactionAmount,
            ),
            ElevatedButton(
              onPressed: submitData,
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              child: const Text(
                'Add transaction',
              ),
            )
          ],
        ),
      ),
    );
  }
}

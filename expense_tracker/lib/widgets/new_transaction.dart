import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransaction;

  NewTransaction(this.newTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // Saving the input per every key stroke
  final transactionTitle = TextEditingController();

  final transactionAmount = TextEditingController();

  void submitData() {
    final enteredTitle = transactionTitle.text;
    final enteredAmount = double.parse(transactionAmount.text);

    // Covering edge case or Check
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    // Flutter internally provides this widget property
    // This is only available in the State class and gives you access to the connected widget
    // In order to access func or data from widget class from inside of this state class
    widget.newTransaction(
        transactionTitle.text, double.parse(transactionAmount.text));

    // Calling the pop function from Navigator class using .of(context) method
    // This is used to close the top most widget or layer on screen (in this case the bottom sheet after submitting data)
    Navigator.of(context).pop();
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

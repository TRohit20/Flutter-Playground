import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function newTransaction;

  NewTransaction(this.newTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  // Saving the input per every key stroke
  final _transactionTitle = TextEditingController();

  final _transactionAmount = TextEditingController();
  DateTime _pickedDate = DateTime(2023);

  void _submitData() {
    final enteredTitle = _transactionTitle.text;
    final enteredAmount = double.parse(_transactionAmount.text);

    // Covering edge case or Check
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _pickedDate == null) {
      return;
    }

    // Flutter internally provides this widget property
    // This is only available in the State class and gives you access to the connected widget
    // In order to access func or data from widget class from inside of this state class
    widget.newTransaction(_transactionTitle.text,
        double.parse(_transactionAmount.text), _pickedDate);

    // Calling the pop function from Navigator class using .of(context) method
    // This is used to close the top most widget or layer on screen (in this case the bottom sheet after submitting data)
    Navigator.of(context).pop();
  }

  void _selectDate() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2023),
            lastDate: DateTime.now())
        .then((selectedDate) {
      if (selectedDate == null) {
        return;
      }

      setState(() {
        _pickedDate = selectedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'Name of the Expense',
                      controller: _transactionTitle,
                      onSubmitted: (_) => _submitData(),
                    )
                  : TextField(
                      decoration:
                          const InputDecoration(labelText: 'Name of expense'),
                      controller: _transactionTitle,
                      onSubmitted: (_) => _submitData(),
                      // onChanged: (value) => transactionTitle = value,),
                    ),
              Platform.isIOS
                  ? CupertinoTextField(
                      placeholder: 'Amount',
                      controller: _transactionAmount,
                      onSubmitted: (_) => _submitData())
                  : TextField(
                      decoration: const InputDecoration(labelText: 'Amount'),
                      controller: _transactionAmount,
                    ),
              Row(
                children: [
                  Expanded(
                    child: Text(_pickedDate == null
                        ? 'No date chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_pickedDate)}'),
                  ),
                  Platform.isIOS
                      ? CupertinoButton(
                          onPressed: _selectDate,
                          child: Text(
                            'Choose a Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                      : ElevatedButton(
                          onPressed: _selectDate,
                          child: Text(
                            'Choose a Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                ],
              ),
              ElevatedButton(
                  onPressed: _submitData,
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: const Text(
                    'Add transaction',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

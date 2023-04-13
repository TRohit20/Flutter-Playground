import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _enteredTitle = '';

  void _titleInput(String value) {
    _enteredTitle = value;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            onChanged: _titleInput,
            maxLength: 50,
            decoration: const InputDecoration(labelText: 'Expense Title'),
          ),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Add Expense'))
            ],
          )
        ],
      ),
    );
  }
}

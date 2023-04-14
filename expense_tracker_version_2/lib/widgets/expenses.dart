import 'package:expense_tracker_version_2/models/expense.dart';
import 'package:expense_tracker_version_2/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker_version_2/widgets/expenses_list/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpense = [
    Expense(
        title: 'Watch',
        amount: 300,
        date: DateTime.now(),
        category: Category.luxury),
    Expense(
        title: 'Jordan Shoes',
        amount: 240,
        date: DateTime.now(),
        category: Category.luxury)
  ];

  void addExpense() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) //Context of modal bottom sheet
          {
        return NewExpense(newExpenseToTheList);
      },
    );
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registeredExpense.indexOf(expense);
    setState(() {
      _registeredExpense.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpense.insert(expenseIndex, expense);
              });
            }),
        duration: const Duration(seconds: 5),
        content: const Text('Expense removed')));
  }

  void newExpenseToTheList(Expense expense) {
    setState(() {
      _registeredExpense.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _registeredExpense.isEmpty
        ? const Center(
            child: Text('No transactions found, How about you add some?'))
        : ExpenseList(
            expenses: _registeredExpense, deleteExpenses: removeExpense);

    return Scaffold(
      appBar: AppBar(title: const Text('Expense Tracker'), actions: [
        IconButton(onPressed: addExpense, icon: const Icon(Icons.add))
      ]),
      body: Column(children: [
        const Text('Chart will be here'),
        Expanded(child: mainContent)
      ]),
    );
  }
}

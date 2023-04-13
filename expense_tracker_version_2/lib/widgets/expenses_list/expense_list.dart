import 'package:expense_tracker_version_2/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

import '../../models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(Expense) deleteExpenses;

  const ExpenseList(
      {required this.deleteExpenses, super.key, required this.expenses});

  Widget listItemsBuilderFunction(BuildContext context, int index) {
    return Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          deleteExpenses(expenses[index]);
        },
        child: ExpenseItem(expenses[index]));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //Creates list and items only when they are visible
      itemCount: expenses.length,
      itemBuilder: listItemsBuilderFunction,
    );
  }
}

import '../widgets/ChartBar.dart';
import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transactions> recentTransactions;

  Chart(this.recentTransactions);

  // A list of maps to generate bar widgets for chart dynamically instead of hard coding
  List<Map<String, Object>> get groupedTransactions {
    // Using generate method to return a list of 7 as week only has 7 days
    // Using the generator func, return the map of weekday and amount spent that day
    return List.generate(7, (index) {
      // Calculates the day
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSpent = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSpent += recentTransactions[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSpent
      };
      // reversed.tolist allows us to generate the list in reverse so the days will be in order now
    }).reversed.toList();
  }

  double get totalAmountSpentInTheWeek {
    return groupedTransactions.fold(
        0.0, (currentSum, item) => currentSum + (item['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      margin: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: groupedTransactions.map((data) {
          return Flexible(
            fit: FlexFit.tight,
            child: ChartBar(
              (data['amount'] as double),
              (data['day'] as String),
              totalAmountSpentInTheWeek == 0
                  ? 0
                  : (data['amount'] as double) / totalAmountSpentInTheWeek,
            ),
          );
        }).toList(),
      ),
    );
  }
}

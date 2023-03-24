import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import './widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import './models/transactions.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transactions> _userTransactions = [
    Transactions(amount: 300, date: DateTime.now(), title: 'New Shoes'),
    Transactions(amount: 700, date: DateTime.now(), title: 'New Watch')
  ];

  // Dynamically getting the recent transactions
  List<Transactions> get _recentTransactions {
    // An Alternative way to FOR Loop is:
    return _userTransactions.where((transaction) {
      return transaction.date
          .isAfter(DateTime.now().subtract(const Duration(days: 7)));
    }).toList(); // We use .toList to convert the iteraables into a list and return jsut like we did for maps

    // 1 way to do it is using FOR loop
    // List<Transactions> recentTransactions = [];

    // for (var i = 0; i < _userTransactions.length; i++) {
    //   if (_userTransactions[i]
    //       .date
    //       .isAfter(DateTime.now().subtract(const Duration(days: 7)))) {
    //     recentTransactions.add(_userTransactions[i]);
    //   }
    // }
    // return recentTransactions;
  }

  void _addingNewTransaction(String title, double amount) {
    final newTransaction =
        Transactions(amount: amount, date: DateTime.now(), title: title);

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  // Function to provide the Bottom Modal
  void _startsToAddNewTransaction(BuildContext ctx) {
    // UKW Context does, Builder is a function that'll return the widget that should be inside
    showModalBottomSheet(
        context: ctx,
        builder: (bctx) {
          // We are ignoring context of this builder for now
          return NewTransaction(_addingNewTransaction);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Expense Tracker App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        // Used to add any widgets or icons to the appbar
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startsToAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Chart(_recentTransactions),
            // ignore: prefer_const_literals_to_create_immutables
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startsToAddNewTransaction(context),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

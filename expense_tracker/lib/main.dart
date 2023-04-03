import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:flutter/services.dart';
import './widgets/transactions_list.dart';
import 'package:flutter/material.dart';
import './models/transactions.dart';

void main() {
  // // Controlling the orientation like this can be viable based on your application.
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

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
    Transactions(
        amount: 300,
        date: DateTime.now(),
        title: 'New Shoes',
        id: DateTime.now().toString()),
    Transactions(
        amount: 700,
        date: DateTime.now(),
        title: 'New Watch',
        id: DateTime.now().toString())
  ];

  bool _showChart = false;

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

  void _addingNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTransaction = Transactions(
        amount: amount,
        date: chosenDate,
        title: title,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((transaction) => transaction.id == id);
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
    final appBar = AppBar(
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
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Show Chart",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    })
              ],
            ),
            _showChart
                ? Container(
                    height: (MediaQuery.of(
                                    context) // Since, it has metadata, it gives us the device details too
                                .size
                                .height // MediaQuery is the class provided by flutter used to get the height dynamically as per device
                            -
                            appBar.preferredSize
                                .height // preferredSize is a func that is pretty self-explainatory
                            -
                            MediaQuery.of(context)
                                .padding
                                .top) // padding.top is used specifically for the notch or status bar as that is also part of the screen
                        *
                        0.3,
                    child: Chart(_recentTransactions))
                : Container(
                    height: (MediaQuery.of(context).size.height -
                            appBar.preferredSize.height -
                            MediaQuery.of(context).padding.top) *
                        0.7,
                    child:
                        TransactionList(_userTransactions, _deleteTransaction)),
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

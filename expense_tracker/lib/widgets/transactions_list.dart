import 'package:flutter/material.dart';
import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transactions;
  final Function deleteTx;

  // Using constructor to pass data from parent to child
  // Using this to pass the transactions data
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? LayoutBuilder(
              builder: (ctx, constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No transactions found',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    // Just a empty box for space
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/hello.png',
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  elevation: 7,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  color: Colors.green.shade300,
                  child: ListTile(
                    leading: CircleAvatar(
                      // backgroundColor: Colors,
                      foregroundColor: Colors.black,
                      radius: 60,
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: FittedBox(
                            child: Text(
                          '\$ ${transactions[index].amount}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: MediaQuery.of(context).size.width > 400
                        ? TextButton.icon(
                            onPressed: () => deleteTx(transactions[index].id),
                            style: const ButtonStyle(
                                iconColor:
                                    MaterialStatePropertyAll(Colors.redAccent)),
                            icon: Icon(Icons.delete),
                            label: const Text(
                              'Delete',
                              style: TextStyle(color: Colors.redAccent),
                            ),
                          )
                        : IconButton(
                            onPressed: () => deleteTx(transactions[index].id),
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                          ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

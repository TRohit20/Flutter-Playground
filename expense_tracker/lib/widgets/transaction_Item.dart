import 'package:flutter/material.dart';

import '../models/transactions.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    super.key,
    required this.transaction,
    required this.deleteTx,
  });

  final Transactions transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
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
              '\$ ${transaction.amount}',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
                onPressed: () => deleteTx(transaction.id),
                style: const ButtonStyle(
                    iconColor: MaterialStatePropertyAll(Colors.redAccent)),
                icon: Icon(Icons.delete),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.redAccent),
                ),
              )
            : IconButton(
                onPressed: () => deleteTx(transaction.id),
                icon: Icon(Icons.delete),
                color: Colors.red,
              ),
      ),
    );
  }
}

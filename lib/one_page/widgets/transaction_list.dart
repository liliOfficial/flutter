

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No transactions added yet!',
                    style: Theme.of(context).textTheme.title),
                Image.asset(
                  'assets/images/empty.png',
                  height: constraints.maxHeight * 0.5,
                ),
              ],
            );
          })
        : ListView(
            children: transactions.map((tx) {
              return Container(
                width: double.infinity,
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        child: Text(
                          '\$ ' + tx.amount.toStringAsFixed(2),
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              tx.title,
                              style: Theme.of(context).textTheme.title,
                            ),
                            Text(
                              DateFormat().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).primaryColor,
                        onPressed: () => deleteTx(tx.id),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
  }
}

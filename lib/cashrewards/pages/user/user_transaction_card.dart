import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/models/transaction.dart';

class UserTransactionCard extends StatelessWidget {
  final Transaction transaction;

  UserTransactionCard(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 15),
                      child: Image.network(
                        transaction.logoImage,
                        width: 90,
                        height: 70,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          transaction.merchantName,
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text(transaction.date),
                        ),
                        Text('Enquire >',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor)),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(transaction.estimated == ''
                      ? 'Cashback approved!'
                      : 'Estimated approved: ' + transaction.estimated),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Theme.of(context).dividerColor),
                ),
              ),
              padding: EdgeInsets.only(left: 10),
              width: 110,
              child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 2, bottom: 3),
                    margin: EdgeInsets.only(bottom: 3),
                    color: transaction.status == 'Approved'
                        ? Colors.green
                        : Colors.orange,
                    child: Center(
                      child: Text(
                        transaction.status,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    '\$ ' + transaction.cashback,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    'Cashback',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AUD ',
                          style: TextStyle(fontSize: 15),
                        ),
                        Text(
                          transaction.amount,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Spent',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

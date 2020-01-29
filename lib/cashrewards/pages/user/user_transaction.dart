import 'package:flutter/material.dart';

import 'user_transaction_card.dart';

class UserTransaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 75,
        bottom: 40,
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [0, 1, 2, 3, 4]
                        .map((data) => UserTransactionCard())
                        .toList(),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

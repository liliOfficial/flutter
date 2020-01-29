import 'package:flutter/material.dart';

class UserTransactionCard extends StatelessWidget {
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
                      padding: EdgeInsets.only(right: 10),
                      child: Image.network(
                        'https://cdn.cashrewards.com/ajisen-ramen.jpg',
                        width: 90,
                        height: 70,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'IKEA',
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          child: Text('20 Jan 2020'),
                        ),
                        Text('Enquire >'),
                      ],
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('Cashback approved!'))
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
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        'Approved',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(
                    '\$50.00',
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
                          '245.55',
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

import 'package:flutter/material.dart';

import 'search_card_cashback.dart';

class SearchCard extends StatelessWidget {
  final merchantData;
  SearchCard(this.merchantData);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        // margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                    bottom: 5
                  ),
              child: Text(merchantData['name'], style: TextStyle(fontSize: 18)),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 120,
                  height: 90,
                  padding: EdgeInsets.only(
                    right: 10,
                    top: 10,
                  ),
                  child: Image.network(
                    merchantData['logoImageUrl'],
                    width: 90,
                    height: 80,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (merchantData['onlineRate'] != '')
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/merchant',
                                  arguments: {
                                    'name': merchantData['name'].toString()
                                  });
                            },
                            child: SearchCardCashback(
                                Theme.of(context).primaryColor,
                                'Online',
                                merchantData['onlineRate']),
                          ),
                        if (merchantData['instoreRate'] != '')
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('/merchant',
                                  arguments: {
                                    'name': merchantData['name'].toString(),
                                    'type':'instore',
                                  });
                            },
                            child: SearchCardCashback(
                                Theme.of(context).accentColor,
                                'In Store',
                                merchantData['instoreRate']),
                          ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

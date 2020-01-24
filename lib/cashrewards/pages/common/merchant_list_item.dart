import 'package:flutter/material.dart';

class MerchantListItem extends StatelessWidget {
  final int id;
  final String name;
  final String backgroundImageUrl;
  final String logoImageUrl;
  final String commissionString;
  final String description;

  MerchantListItem(
    this.id,
    this.name,
    this.backgroundImageUrl,
    this.logoImageUrl,
    this.commissionString,
    this.description,
  );
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 20),
              width: 150,
              height: 60,
              child: Image.network(
                logoImageUrl,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(fontSize: 18),
                  ),
                  Container(
                    padding:EdgeInsets.only(top:5),
                    child: Text(
                      commissionString,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16
                      ),
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

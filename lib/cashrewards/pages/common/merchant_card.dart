import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final int id;
  final String name;
  final String backgroundImageUrl;
  final String logoImageUrl;
  final String commissionString;
  final String description;
  final String navigateType;

  CardItem(
    this.id,
    this.name,
    this.backgroundImageUrl,
    this.logoImageUrl,
    this.commissionString,
    this.description,
    this.navigateType,
  );

  void selectStore(BuildContext context) {
    Navigator.of(context).pushNamed('/merchant', arguments: {'name': name, 'type': navigateType});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectStore(context),
      child: Card(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: new BorderRadius.circular(3),
              child: Image.network(
                backgroundImageUrl,
                height: 135,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 120,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.network(
                          logoImageUrl,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 3,
                    ),
                    child: Text(
                      commissionString,
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14),
                    ),
                  ),
                  Text(
                    description,
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

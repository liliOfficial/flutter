import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/linked_card.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CardListCard extends StatelessWidget {
  final cardData;

  CardListCard(this.cardData);

  @override
  Widget build(BuildContext context) {
    final Color textColor = Colors.grey[600];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Card number',
                    style: TextStyle(color: textColor),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                    ),
                    child: Text(
                      '**** **** **** ' + cardData['cardLastFour'],
                      style: TextStyle(fontSize: 25, color: textColor),
                    ),
                  ),
                  Text(
                    'Date added',
                    style: TextStyle(color: textColor),
                  ),
                  Text(
                    DateFormat.yMMMMd()
                        .format(DateTime.parse(cardData['addedDate'])),
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: textColor,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 5),
                  height: 96,
                  // color: Colors.grey[100],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: Text('Are you sure?'),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text(
                                      'Yes',
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Provider.of<LinkedCardProvider>(context,
                                              listen: false)
                                          .deleteCard(cardData['cardId']);
                                      Navigator.of(ctx).pop(false);
                                    },
                                  ),
                                  FlatButton(
                                    child: Text(
                                      'No',
                                      style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(ctx).pop(false);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                'Remove ',
                                style:
                                    TextStyle(color: textColor, fontSize: 16),
                              ),
                              Icon(
                                Icons.delete,
                                color: textColor,
                                size: 18,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: cardData['type'] == 'VISA'
                            ? Image.asset(
                                'assets/images/visa.png',
                                height: 26,
                              )
                            : Image.asset(
                                'assets/images/mastercard.png',
                                height: 40,
                              ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

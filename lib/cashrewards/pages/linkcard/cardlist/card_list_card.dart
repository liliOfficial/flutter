import 'package:flutter/material.dart';

class CardListCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Card number',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 8,
                  bottom: 15,
                ),
                child: Text(
                  '**** **** **** 8888',
                  style: TextStyle(fontSize: 25, color: Colors.grey[600]),
                ),
              ),
              Text(
                'Date added',
                style: TextStyle(color: Colors.grey[600]),
              ),
              Text(
                'Nov 28, 2019',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SearchCardCashback extends StatelessWidget {
  final color;
  final String title;
  final String cashbackValue;
  SearchCardCashback(this.color, this.title, this.cashbackValue);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 10, bottom: 3),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          child: Text(
            cashbackValue,
            style: TextStyle(
              // color: color,
              fontSize: 16,
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: color,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(3)),
        ),
        Container(
          margin: EdgeInsets.only(left: 10),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          color: Colors.white,
          child: Text(
            title,
            style: TextStyle(color: color, fontSize: 12),
          ),
        ),
      ],
    );
  }
}

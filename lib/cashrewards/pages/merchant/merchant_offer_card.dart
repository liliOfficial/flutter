import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/shared/circle_icon_button.dart';

class MerchantOfferCard extends StatelessWidget {
  final String title;
  final String endTime;
  final String couponCode;

  MerchantOfferCard(this.title, this.endTime, this.couponCode);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      child: DottedBorder(
        padding: EdgeInsets.all(20),
        color: Colors.deepPurple,
        radius: Radius.circular(3),
        dashPattern: [9, 5],
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 15),
                child: Text('Ends in: ' + endTime),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(couponCode),
                  CircleIconButton(
                      wordColor: Colors.white,
                      backgroundColor: Colors.deepPurple,
                      icon: Icons.shopping_cart,
                      onPressed: () {}),
                  // Ink(
                  //   decoration: ShapeDecoration(
                  //     color: Colors.deepPurple,
                  //     shape: CircleBorder(),
                  //   ),
                  //   child: IconButton(
                  //     icon: Icon(Icons.shopping_cart),
                  //     color: Colors.white,
                  //     onPressed: () {
                  //       Clipboard.setData(new ClipboardData(text:couponCode));
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

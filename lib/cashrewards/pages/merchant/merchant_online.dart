import 'package:flutter/material.dart';

import 'merchant_offer.dart';
import 'widgets/merchant_banner.dart';
import 'widgets/merchant_hiw_button.dart';
import 'widgets/merchant_notification.dart';
import 'widgets/merchant_tips.dart';

class MerchantOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        MerchantBanner(),
        Container(
          padding: EdgeInsets.only(top: 20, left: 5, right: 5, bottom: 30),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  '20% Cashback',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 24),
                ),
              ),
              Container(
                child: FlatButton(
                  padding: EdgeInsets.all(0.0),
                  color: Colors.deepPurple,
                  child: Container(
                    width: 200,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Colors.deepPurple,
                          Color(0xFF8700D7),
                        ],
                      ),
                    ),
                    child: Text(
                      'Shop Now',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              MerchantHIWButton(),
              MerchantTip(),
              MerchantOffer(),
              MerchantNotification(),
            ],
          ),
        ),
      ],
    );
  }
}

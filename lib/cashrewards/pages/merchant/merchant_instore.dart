import 'package:flutter/material.dart';

import 'widgets/merchant_banner.dart';
import 'widgets/merchant_hiw_button.dart';
import 'widgets/merchant_notification.dart';
import 'widgets/merchant_tips.dart';

class MerchantInstore extends StatelessWidget {
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
                  top: 5,
                  bottom: 5,
                ),
                child: Text(
                  '5.60% Cashback',
                  style: TextStyle(color: Colors.deepPurple, fontSize: 24),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(right: 5),
                    child:
                        Icon(Icons.store, color: Theme.of(context).accentColor),
                  ),
                  Text('Shop in-store using your linked cards',
                      style: TextStyle(fontSize: 17)),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Text('Minimun spend: \$150'),
              ),
              MerchantHIWButton(),
              MerchantTip(),
              MerchantNotification(),
            ],
          ),
        ),
      ],
    );
  }
}

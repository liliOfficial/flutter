import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/coupons.dart';

import 'merchant_offer_card.dart';

class MerchantOffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 15,
        left: 5,
        right: 5,
        bottom: 15,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Offers & Coupons',
            style: TextStyle(fontSize: 21),
          ),
          Column(
            children: COUPONS.map((data) =>
                MerchantOfferCard(data.title, data.endTime, data.couponCode)).toList(),
          ),
        ],
      ),
    );
  }
}

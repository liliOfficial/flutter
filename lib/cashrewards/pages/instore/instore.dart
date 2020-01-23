import 'package:flutter/material.dart';

import 'package:flutter_app/cashrewards/data/instore_offers_data.dart';
import 'package:flutter_app/cashrewards/pages/common/carousel.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_card.dart';
import 'package:flutter_app/cashrewards/pages/layout/footer.dart';

class Instore extends StatelessWidget {
  static const routeName = '/instore';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Featured'),
              Tab(text: 'Nearby'),
            ],
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black,
          ),
          title: Text('In-store 0ffers'),
        ),
        body: TabBarView(
          children: [
            GridView(
              padding: EdgeInsets.all(5),
              children: INSTORE_MERCHANT
                  .map((data) => CardItem(
                        data.id,
                        data.name,
                        data.backgroundImageUrl,
                        data.logoImageUrl,
                        data.commissionString,
                        data.cardLinkedSpecialTerms,
                      ))
                  .toList(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 0.85,
              ),
            ),
            Carousel(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_app/cashrewards/data/instore_offers_data.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_card.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_list_item.dart';

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
            ListView(
              children: <Widget>[
                Container(height: 300, child: Text('map')),
                Column(
                  children: INSTORE_MERCHANT
                      .map((data) => MerchantListItem(
                            data.id,
                            data.name,
                            data.backgroundImageUrl,
                            data.logoImageUrl,
                            data.commissionString,
                            data.cardLinkedSpecialTerms,
                          ))
                      .toList(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

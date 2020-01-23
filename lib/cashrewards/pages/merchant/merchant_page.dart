import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/layout/footer.dart';
import 'package:flutter_app/cashrewards/pages/merchant/merchant_offer.dart';

import 'merchant_notification.dart';

class MerchantPage extends StatelessWidget {
  static const routeName = '/merchant';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(routeArgs['name']),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(
                'https://cdn.cashrewards.com/category-image/chat-thai-standard-cashback.jpg',
              ),
              Container(
                padding:
                    EdgeInsets.only(top: 10, left: 5, right: 5, bottom: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        top: 5,
                        bottom: 5,
                      ),
                      child: Text(
                        '20% Cashback',
                        style:
                            TextStyle(color: Colors.deepPurple, fontSize: 24),
                      ),
                    ),
                    Container(
                      child: FlatButton(
                        padding: const EdgeInsets.all(0.0),
                        color: Colors.deepPurple,
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
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
                    Container(
                      child: OutlineButton(
                        padding: const EdgeInsets.all(0.0),
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'How It Works',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    MerchantOffer(),
                    Container(
                      padding: EdgeInsets.only(
                        top: 8,
                        bottom: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text('Terms'),
                          Text('Cashback rates'),
                          Text('Cashback tips'),
                        ],
                      ),
                    ),
                    MerchantNotification(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Footer(),
    );
  }
}

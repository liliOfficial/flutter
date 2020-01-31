import 'package:flutter/material.dart';

import 'merchant_instore.dart';
import 'merchant_online.dart';

class MerchantPage extends StatelessWidget {
  static const routeName = '/merchant';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(routeArgs['name']),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Online'),
              Tab(text: 'In Store'),
            ],
            labelColor: Colors.deepOrange,
            unselectedLabelColor: Colors.black,
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: <Widget>[
              MerchantOnline(),
              MerchantInstore(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_app/cashrewards/models/merchant_card.dart';

import 'package:flutter_app/cashrewards/providers/instore.dart';
import 'package:provider/provider.dart';

import 'favorite_grid.dart';
import 'favorite_list.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    final List<MerchantCard> _availableData =
        Provider.of<InstoreProvider>(context).instoreProvider.where((data) {
      return data.isFavorite == true;
    }).toList();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          bottom: TabBar(
            tabs: [
              Tab(text: 'Grid'),
              Tab(text: 'List'),
            ],
            labelColor: Theme.of(context).accentColor,
            unselectedLabelColor: Colors.black,
          ),
          title: Column(
            children: <Widget>[
              Text('My Favorite'),
              Text(
                'You have ' +
                    _availableData.length.toString() +
                    ' items in the list',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            FavoriteGrid(),
            FavoriteList(),
          ],
        ),
      ),
    );
  }
}

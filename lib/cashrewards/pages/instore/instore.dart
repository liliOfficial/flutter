import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/globle.dart';

import 'package:flutter_app/cashrewards/models/merchant_card.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_card.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_list_item.dart';
import 'package:flutter_app/cashrewards/providers/instore.dart';
import 'package:flutter_app/shared/circle_icon.dart';
import 'package:provider/provider.dart';

import 'instore_drawer.dart';

class Instore extends StatefulWidget {
  static const routeName = '/instore';

  @override
  _InstoreState createState() => _InstoreState();
}

class _InstoreState extends State<Instore> {
  List<MerchantCard> _availableData;
  String filterKey = 'ALL';

  void _setFilters(String location) {
    setState(() {
      filterKey = location;
    });
  }

  @override
  Widget build(BuildContext context) {
    _availableData = filterKey == 'ALL'
        ? Provider.of<InstoreProvider>(context).instoreProvider
        : Provider.of<InstoreProvider>(context).instoreProvider.where((data) {
            return data.location.contains(filterKey);
          }).toList();

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
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (result) {
                setState(() {
                  filterKey = result;
                });
              },
              icon: Icon(Icons.sort),
              itemBuilder: (_) => STATES
                  .map(
                    (item) => PopupMenuItem(
                      value: item,
                      child: Text(item),
                    ),
                  )
                  .toList(),
            )
          ],
        ),
        drawer: InstoreDrawer(_setFilters),
        body: TabBarView(
          children: [
            // GridView(
            //   padding: EdgeInsets.all(5),
            //   children: _availableData
            //       .map((data) => CardItem(
            //             data.id,
            //             data.name,
            //             data.backgroundImageUrl,
            //             data.logoImageUrl,
            //             data.commissionString,
            //             data.cardLinkedSpecialTerms,
            //           ))
            //       .toList(),
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 250,
            //     childAspectRatio: 0.85,
            //   ),
            // ),
            GridView.builder(
              padding: EdgeInsets.all(5),
              itemCount: _availableData.length,
              itemBuilder: (ctx, i) => Stack(children: [
                CardItem(
                  _availableData[i].id,
                  _availableData[i].name,
                  _availableData[i].backgroundImageUrl,
                  _availableData[i].logoImageUrl,
                  _availableData[i].commissionString,
                  _availableData[i].cardLinkedSpecialTerms,
                  'instore',
                ),
                Positioned(
                  right: 10,
                  top: 120,
                  child: CircleIcon(
                    color: Theme.of(context).accentColor,
                    icon: _availableData[i].isFavorite == true
                        ? Icons.star
                        : Icons.star_border,
                    onTap: () {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                            duration: Duration(milliseconds: 1000),
                            content: Text(_availableData[i].isFavorite == true
                                ? 'Remove from Favorite'
                                : 'Add to Favorite'),
                            action: SnackBarAction(
                              label: 'UNDO',
                              onPressed: () {
                                Provider.of<InstoreProvider>(context,
                                        listen: false)
                                    .toggleFavorite(_availableData[i]);
                              },
                            )),
                      );
                      Provider.of<InstoreProvider>(context, listen: false)
                          .toggleFavorite(_availableData[i]);
                    },
                  ),
                ),
              ]),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 0.85,
              ),
            ),
            ListView(
              children: <Widget>[
                Container(height: 300, child: Text('map')),
                Column(
                  children: _availableData
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

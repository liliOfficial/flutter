import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/models/merchant_card.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_list_item.dart';
import 'package:flutter_app/cashrewards/providers/instore.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MerchantCard> _availableData =
        Provider.of<InstoreProvider>(context).instoreProvider.where((data) {
      return data.isFavorite == true;
    }).toList();
    return ListView.builder(
      itemCount: _availableData.length,
      itemBuilder: (ctx, i) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Theme.of(context).errorColor,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.only(bottom: 2),
        ),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          Provider.of<InstoreProvider>(context, listen: false)
              .deleteFavorite(_availableData[i]);
        },
        child: MerchantListItem(
          _availableData[i].id,
          _availableData[i].name,
          _availableData[i].backgroundImageUrl,
          _availableData[i].logoImageUrl,
          _availableData[i].commissionString,
          _availableData[i].cardLinkedSpecialTerms,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/models/merchant_card.dart';
import 'package:flutter_app/cashrewards/pages/common/merchant_card.dart';
import 'package:flutter_app/cashrewards/providers/instore.dart';
import 'package:flutter_app/shared/circle_icon.dart';
import 'package:provider/provider.dart';

class FavoriteGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MerchantCard> _availableData =
        Provider.of<InstoreProvider>(context).instoreProvider.where((data) {
      return data.isFavorite == true;
    }).toList();
    return GridView.builder(
      padding: EdgeInsets.all(5),
      itemCount: _availableData.length,
      itemBuilder: (ctx, i) => Stack(
        children: [
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
              icon: Icons.delete,
              onTap: () {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                      duration: Duration(milliseconds: 2000),
                      content: Text('Remove from Favorite'),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          Provider.of<InstoreProvider>(context, listen: false)
                              .toggleFavorite(_availableData[i]);
                        },
                      )),
                );
                Provider.of<InstoreProvider>(context, listen: false)
                    .deleteFavorite(_availableData[i]);
              },
            ),
          ),
        ],
      ),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 0.85,
      ),
    );
  }
}

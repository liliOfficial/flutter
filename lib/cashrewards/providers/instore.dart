import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/instore_offers_data.dart';

import '../models/merchant_card.dart';

class InstoreProvider with ChangeNotifier {
  List<MerchantCard> instoreProvider = INSTORE_MERCHANT;

  void toggleFavorite(int index) {
    instoreProvider[index].isFavorite = !instoreProvider[index].isFavorite;
    notifyListeners();
  }

  void deleteFavorite(MerchantCard item) {
    instoreProvider.firstWhere((data) => data == item).isFavorite = false;
    notifyListeners();
  }

  void filterData(String location) {
    instoreProvider = location == 'ALL'
        ? instoreProvider
        : instoreProvider.where((data) {
            return data.location.contains(location);
          }).toList();
  }
}

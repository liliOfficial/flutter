import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/instore_offers_data.dart';

import '../models/merchant_card.dart';

class InstoreData with ChangeNotifier {
  List<MerchantCard> instoreData = INSTORE_MERCHANT;

  void toggleFavorite(int index) {
    // instoreData[index].isFavorite = !instoreData[index].isFavorite;
    notifyListeners();
  }
}
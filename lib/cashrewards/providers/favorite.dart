import 'package:flutter/material.dart';

import '../models/merchant_card.dart';

class Favorite with ChangeNotifier {
  List<MerchantCard> favorites = [
    MerchantCard(
      id: 1003984,
      name: 'G-Star RAW',
      backgroundImageUrl:
          'https://cdn.cashrewards.com/category-image/g-star-raw-standard-cashback.jpg',
      logoImageUrl: 'https://cdn.cashrewards.com/g-star-raw.jpg',
      commissionString: '6.00% Cashback',
      cardLinkedSpecialTerms: '',
      isFavorite: true,
      location: ['SA', 'VIC'],
    ),
    MerchantCard(
      id: 1003996,
      name: 'IKEA',
      backgroundImageUrl:
          'https://cdn.cashrewards.com/category-image/ikea-standard-cashback.jpg',
      logoImageUrl: 'https://cdn.cashrewards.com/ikea.jpg',
      commissionString: '\$5.00 Cashback',
      cardLinkedSpecialTerms: 'Minimum spend \$50',
      isFavorite: true,
      location: ['QLD', 'NSW'],
    )
  ];

  void deleteFavorite(item) {
    print('delete called');
    favorites.remove(item);
    notifyListeners();
  }

  void addFavorite(item) {
    favorites.add(item);
    notifyListeners();
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/cardList.dart';

class LinkedCardProvider with ChangeNotifier {
  List linkedCardProvider = CARDLIST;

  void deleteCard(String id) {
    linkedCardProvider =
        linkedCardProvider.where((data) => data['cardId'] != id).toList();
    notifyListeners();
  }

  void addCard(String cardNo, String cardType) {
    print(cardNo.substring(12, 16));
    final newCard = {
      "addedDate": DateTime.now().toString(),
      "cardId": cardType + Random.secure().nextInt(999).toString(),
      "cardLastFour": cardNo.substring(12, 16),
      "status": "Active",
      "type": cardType
    };
    print(newCard['addedDate']);
    linkedCardProvider = [...linkedCardProvider, newCard];
    notifyListeners();
  }
}

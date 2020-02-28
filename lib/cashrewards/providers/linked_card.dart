import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/cardList.dart';

class LinkedCardProvider with ChangeNotifier {
  List linkedCardProvider = CARDLIST;
  bool cardNoValidated = true;
  bool agreementValidated = true;
  String errorMessage = 'Invalid card number';

  void deleteCard(String id) {
    linkedCardProvider =
        linkedCardProvider.where((data) => data['cardId'] != id).toList();
    notifyListeners();
  }

  void initForm(context) {
    cardNoValidated = true;
    agreementValidated = true;
    errorMessage = 'Invalid card number';
    Navigator.of(context).pushNamed('/cardlist');
  }

  void cardValidation(String cardNo) {
    if (cardNo.length == 0) {
      cardNoValidated = false;
      errorMessage = 'Card number is required';
    } else if (cardNo.length < 16) {
      cardNoValidated = false;
      errorMessage = 'Invalid card number';
    } else {
      cardNoValidated = true;
    }

    if (cardNoValidated) notifyListeners();
  }

  void termValidation() {}

  void addCard(String cardNo, checkboxValue, String cardType, context) {
    print(checkboxValue);

    cardValidation(cardNo);
    agreementValidated = checkboxValue;

    if (cardNoValidated && agreementValidated) {
      cardNoValidated = true;
      final newCard = {
        "addedDate": DateTime.now().toString(),
        "cardId": cardType + Random.secure().nextInt(999).toString(),
        "cardLastFour": cardNo.substring(12, 16),
        "status": "Active",
        "type": cardType.toUpperCase(),
      };

      linkedCardProvider = [...linkedCardProvider, newCard];

      Navigator.of(context).pushNamed('/cardlist');
    }

    notifyListeners();
  }
}

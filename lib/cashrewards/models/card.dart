import 'package:flutter/material.dart';

class Card {
  final String cardId;
  final String cardLastFour;
  final String statues;
  final String addedDate;
  final String type;

  const Card({
    @required this.cardId,
    @required this.cardLastFour,
    @required this.statues,
    @required this.addedDate,
    @required this.type,
  });
}

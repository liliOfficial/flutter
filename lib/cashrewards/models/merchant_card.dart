import 'package:flutter/material.dart';

class MerchantCard {
  final int id;
  final String name;
  final String backgroundImageUrl;
  final String logoImageUrl;
  final String commissionString;
  final String cardLinkedSpecialTerms;
  final List<String> location;
  bool isFavorite;

  MerchantCard ({
    @required this.id,
    @required this.name,
    @required this.backgroundImageUrl,
    @required this.logoImageUrl,
    @required this.commissionString,
    @required this.cardLinkedSpecialTerms,
    @required this.location,
    @required this.isFavorite,
  });
}
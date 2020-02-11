import 'package:flutter/material.dart';

class Transaction {
  final String logoImage;
  final String merchantName;
  final String date;
  final String status;
  final String amount;
  final String cashback;
  final String estimated;

  const Transaction({
    @required this.logoImage,
    @required this.merchantName,
    @required this.date,
    @required this.status,
    @required this.amount,
    @required this.cashback,
    @required this.estimated,
  });
}
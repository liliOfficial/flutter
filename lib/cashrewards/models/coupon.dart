import 'package:flutter/material.dart';

class Coupon {
  final String title;
  final String endTime;
  final String couponCode;

  const Coupon ({
    @required this.title,
    @required this.endTime,
    this.couponCode = 'No code required',
  });
}
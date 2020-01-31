import 'package:flutter/material.dart';

class MerchantBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        'https://cdn.cashrewards.com/category-image/chat-thai-standard-cashback.jpg',
        width: double.infinity,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MerchantHIWButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        padding: const EdgeInsets.all(0.0),
        child: Container(
          width: 200,
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'How It Works',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/howitworks');
        },
      ),
    );
  }
}

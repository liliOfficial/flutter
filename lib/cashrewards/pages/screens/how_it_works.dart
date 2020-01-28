import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/webview.dart';

class HowItWorks extends StatelessWidget {
  static const routeName = '/howitworks';
  @override
  Widget build(BuildContext context) {
    return WebviewPage('How it works',
        'https://www.cashrewards.com.au/how-it-works?showheader=false');
  }
}

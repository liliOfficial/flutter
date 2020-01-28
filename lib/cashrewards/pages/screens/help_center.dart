import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/webview.dart';

class HelpCenter extends StatelessWidget {
  static const routeName = '/helpcenter';
  @override
  Widget build(BuildContext context) {
    return WebviewPage('Help Center',
        'https://help.cashrewards.com.au/support/home');
  }
}

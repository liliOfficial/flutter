import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/common/webview.dart';

class WebViewScreen extends StatelessWidget {
  static const routeName = '/webview';
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
        
    return WebviewPage(routeArgs['title'], routeArgs['url']);
  }
}

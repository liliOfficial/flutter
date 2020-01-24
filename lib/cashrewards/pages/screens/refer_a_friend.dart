import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReferAFriend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Refer a friend'),
      ),
      body: WebView(
        initialUrl: 'https://www.cashrewards.com.au/how-it-works?showheader=false',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

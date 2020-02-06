import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ReferAFriend extends StatefulWidget {
  @override
  _ReferAFriendState createState() => _ReferAFriendState();
}

class _ReferAFriendState extends State<ReferAFriend> {
  bool _isLoadingPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Refer a friend'),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl:
                'https://www.cashrewards.com.au/how-it-works?showheader=false',
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (start) {
              setState(() {
                _isLoadingPage = false;
              });
            },
          ),
          if (_isLoadingPage)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}

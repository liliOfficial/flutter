import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewPage extends StatefulWidget {
  static const routeName = 'webview';
  final String title;
  final String pageUrl;

  WebviewPage(this.title, this.pageUrl);

  @override
  _WebviewPageState createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  bool _isLoadingPage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[
                Color(0xFF3023AE),
                Color(0xFF8700D7),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            initialUrl: widget.pageUrl,
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

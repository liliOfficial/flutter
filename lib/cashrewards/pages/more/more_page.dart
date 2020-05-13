import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/sign_in.dart';
import 'package:provider/provider.dart';

import 'more_list.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            child: Image.asset(
              'assets/images/logo.png',
              width: 120,
            ),
          ),
          MoreList(),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/webview', arguments: {
                    'title': 'Terms & Conditions',
                    'url':
                        'https://www.cashrewards.com.au/terms-and-conditions?showheader=false&showfooter=false'
                  });
                },
                child: Text(
                  'Terms and Conditions',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/webview', arguments: {
                    'title': 'Privacy Policy',
                    'url':
                        'https://www.cashrewards.com.au/privacy?showheader=false&showfooter=false'
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'Privacy Policy',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed('/');
                  Provider.of<SignInProvider>(context,listen: false).logout();
                },
                child: Text(
                  'Sign Out',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}

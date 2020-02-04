import 'package:flutter/material.dart';
import 'package:flutter_app/shared/circle_word_button.dart';

class UserInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.account_circle,
              size: 60,
              color: Colors.white,
            ),
          ),
          Text(
            'Li Li',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 3),
            child: Text(
              'Rewards Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
          Text(
            '\$8888.88',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Available Balance: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                Text(
                  '\$666.66',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          CircleWordButton(
            width: 90,
            height: 90,
            icon: Icons.attach_money,
            text: 'Get paid',
            onTap: () {},
          ),
          Text(
            'Lifetime Rewards',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              '\$9999.99',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

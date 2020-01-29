import 'package:flutter/material.dart';

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
            padding: EdgeInsets.only(top: 30,bottom: 3),
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
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                  blurRadius: 8, // has the effect of softening the shadow
                  spreadRadius: 4, // has the effect of extending the shadow
                  offset: Offset(4, 4),
                ),
              ],
              borderRadius: BorderRadius.circular(100),
            ),
            margin: EdgeInsets.all(15),
            child: SizedBox.fromSize(
              size: Size(85, 85), // button width and height
              child: ClipOval(
                child: Material(
                  color: Theme.of(context).accentColor, // button color
                  child: InkWell(
                    splashColor: Colors.white, // splash color
                    onTap: () {}, // button pressed
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.attach_money,
                          color: Colors.white,
                          size: 30,
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            "Get Paid",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
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

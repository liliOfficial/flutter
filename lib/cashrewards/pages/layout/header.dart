import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'assets/images/logo.png',
            width: 200,
          ),
          Container(
            padding: EdgeInsets.only(
              top: 2,
              bottom: 2,
              left: 3,
              right: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: (){Navigator.of(context).pushNamed('/user');},
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.account_circle,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                  Text(' \$888.88',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 15.5)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

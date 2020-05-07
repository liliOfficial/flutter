import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/Favorite/favorite_page.dart';
import 'package:flutter_app/cashrewards/pages/instore/instore.dart';
import 'package:flutter_app/cashrewards/pages/more/more_page.dart';
import 'package:flutter_app/cashrewards/pages/shop/shop.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final _widgetOptions = <Widget>[
    ShopPage(),
    Instore(),
    FavoritePage(),
    MorePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Online'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            title: Text('In-store'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favorite'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('More'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
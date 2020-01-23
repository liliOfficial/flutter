import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/cashrewards/pages/instore/instore.dart';
import 'package:flutter_app/cashrewards/pages/shop/shop.dart';

import 'cashrewards/pages/layout/footer.dart';
import 'cashrewards/pages/merchant/merchant_page.dart';

// import './execise/index.dart';
// import './one_page/index.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.deepPurple,
        primaryColor: Color.fromRGBO(135, 0, 215, 1),
        accentColor: Color.fromRGBO(241, 124, 33, 1),
        fontFamily: 'Montserrat',
        textTheme: ThemeData.light().textTheme.copyWith(
            body1: TextStyle(
              color: Colors.grey[900],
            ),
            body2: TextStyle(
              color: Colors.grey[900],
            ),
            title: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Colors.grey[900]),
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  color: Colors.grey[900],
                  fontFamily: 'Montserrat',
                  fontSize: 24,
                ),
              ),
        ),
      ),
      home: MyHomePage(),
      routes: {
        MerchantPage.routeName: (ctx) => MerchantPage(),
        '/shop': (ctx) => ShopPage(),
        Instore.routeName: (ctx) => Instore(),
      },
    );
  }
}

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
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
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
            icon: Icon(Icons.people),
            title: Text('Refer'),
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
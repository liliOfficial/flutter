import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/pages/auth/join/join.dart';

import 'package:flutter_app/cashrewards/providers/instore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/cashrewards/pages/instore/instore.dart';
import 'package:flutter_app/cashrewards/pages/screens/help_center.dart';
import 'package:flutter_app/cashrewards/pages/screens/web_view.dart';
import 'package:flutter_app/cashrewards/pages/shop/shop.dart';

import 'cashrewards/pages/Favorite/favorite_page.dart';
import 'cashrewards/pages/auth/login.dart';
import 'cashrewards/pages/auth/sign_in/sign_in.dart';
import 'cashrewards/pages/linkcard/cardlist/card_add.dart';
import 'cashrewards/pages/linkcard/cardlist/card_add_info.dart';
import 'cashrewards/pages/linkcard/cardlist/card_list.dart';
import 'cashrewards/pages/merchant/merchant_page.dart';
import 'cashrewards/pages/more/more_page.dart';
import 'cashrewards/pages/screens/how_it_works.dart';
import 'cashrewards/pages/search/search_page.dart';
import 'cashrewards/pages/user/setting/user_setting_page.dart';
import 'cashrewards/pages/user/user_page.dart';
import 'cashrewards/providers/auth.dart';
import 'cashrewards/providers/linked_card.dart';
import 'cashrewards/providers/search.dart';
import 'cashrewards/providers/sign_in.dart';

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
    return MultiProvider(
      child: MaterialApp(
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
          HowItWorks.routeName: (ctx) => HowItWorks(),
          HelpCenter.routeName: (ctx) => HelpCenter(),
          WebViewScreen.routeName: (ctx) => WebViewScreen(),
          UserPage.routeName: (ctx) => UserPage(),
          SearchPage.routeName: (ctx) => SearchPage(),
          CardList.routeName: (ctx) => CardList(),
          CardAdd.routeName: (ctx) => CardAdd(),
          CardAddInfo.routeName: (ctx) => CardAddInfo(),
          Login.routeName: (ctx) => Login(),
          UserSetting.routeName:(ctx) => UserSetting(),
          JoinPage.routeName:(ctx) => JoinPage(),
          SignIn.routeName:(ctx) => SignIn(),
        },
        // onGenerateRoute: (settings) {
        //   print(settings.arguments);
        //   if (settings.arguments) {
        //     return MaterialPageRoute(builder: (ctx) => Login());
        //   }
        // },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => ShopPage());
        },
      ),
      providers: [
        ChangeNotifierProvider(create: (_) => InstoreProvider()),
        ChangeNotifierProvider(create: (_) => SearchProvider()),
        ChangeNotifierProvider(create: (_) => LinkedCardProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        // ChangeNotifierProvider(create: (_) => SignInProvider()),        
      ],
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

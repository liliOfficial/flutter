import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/search.dart';
import 'package:flutter_app/cashrewards/pages/common/go_back_button.dart';

import 'search_card.dart';
import 'search_input.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              ListView(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                      top: 55,
                      bottom: 30,
                    ),
                    child: Column(
                      children:
                          SEARCHRESULT.map((data) => SearchCard(data)).toList(),
                    ),
                  ),
                ],
              ),
              SearchInput(),
            ],
          ),
        ),
      ),
      floatingActionButton: GoBackButton(),
    );
  }
}

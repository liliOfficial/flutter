import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/categories.dart';
import 'package:flutter_app/cashrewards/data/instore_offers_data.dart';
import 'package:flutter_app/cashrewards/pages/common/card_grid.dart';
import 'package:flutter_app/cashrewards/pages/common/card_scroll.dart';
import 'package:flutter_app/cashrewards/pages/common/carousel.dart';
import 'package:flutter_app/cashrewards/pages/layout/header.dart';
import 'package:flutter_app/cashrewards/pages/shop/categories.dart';
import 'package:flutter_app/cashrewards/pages/shop/popular_store.dart';

class ShopPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header(),
              InkWell(
                onTap: () {
                      Navigator.of(context).pushNamed('/search');
                    },
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(                   
                    enabled: false,
                    scrollPadding: EdgeInsets.all(2),
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                        gapPadding: 0,
                      ),
                      prefixIcon: const Icon(
                        Icons.search,
                      ),
                      labelText: 'Search stores and offers',
                    ),
                  ),
                ),
              ),
              Carousel(),
              Categories('What are you looking for?', CATEGORIES),
              CardScroll('Featured offers', INSTORE_MERCHANT),
              CardScroll('Increased cashback offers', INSTORE_MERCHANT),
              PopularStore('Popular stores', INSTORE_MERCHANT),
              CardScroll('In-store', INSTORE_MERCHANT),
              CardGrid(data: INSTORE_MERCHANT, title: 'Trending store'),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/cashrewards/data/banner.dart';

class Carousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      aspectRatio: 16.5 / 8,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      items: BANNERS.map((data) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(1, 2),
                  )
                ],
                image: DecorationImage(
                    image: NetworkImage('https:' + data['mobileImageUrl']),
                    fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

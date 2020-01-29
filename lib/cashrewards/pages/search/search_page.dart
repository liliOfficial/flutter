import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: TextField(
            autofocus: true,
            scrollPadding: EdgeInsets.all(2),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
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
    );
  }
}

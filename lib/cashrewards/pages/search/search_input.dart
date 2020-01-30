import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
    );
  }
}

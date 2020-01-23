import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Function onItemTapped;
  final int selectedIndex;

  Footer(this.selectedIndex,this.onItemTapped);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        currentIndex: selectedIndex,
        onTap: onItemTapped,
      );
  }
}
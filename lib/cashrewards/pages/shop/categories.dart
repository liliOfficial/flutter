import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String title;
  final List data;

  Categories(this.title, this.data);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: 30, left: 10),
          child: Text(title, style: TextStyle(fontSize: 20)),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, left: 5, right: 5),
          height: 120.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: data
                .map(
                  (data) => Container(
                    padding: EdgeInsets.only(top: 15),
                    // color: Colors.grey,
                    width: 100,
                    child: Column(
                      children: <Widget>[
                        Icon(
                          data['icon'],
                          color: Theme.of(context).primaryColor,
                          size: 50,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 15),
                          width: double.infinity,
                          child: Text(
                            data['name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class PopularStore extends StatelessWidget {
  final String title;
  final List data;

  PopularStore(this.title, this.data);

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
          height: 110.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: data
                .map(
                  (data) => Card(
                    child: Container(
                      padding: EdgeInsets.only(top: 15),
                      // color: Colors.grey,
                      width: 150,
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            data.logoImageUrl,
                            height: 30,
                            width: 110,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 15, left: 5, right: 5),
                            width: double.infinity,
                            child: Text(
                              data.commissionString,
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
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoreList extends StatelessWidget {
  static const List listData = [
    {
      'icon': FontAwesomeIcons.user,
      'text': 'My Rewards',
      'url': '/user',
    },
    {
      'icon': FontAwesomeIcons.cogs,
      'text': 'Settings',
      'url': '/howitworks',
    },
    {
      'icon': FontAwesomeIcons.history,
      'text': 'Click History',
      'url': '/howitworks',
    },
    {
      'icon': FontAwesomeIcons.creditCard,
      'text': 'Linked Cards',
      'url': '/cardlist',
    },
    {
      'icon': FontAwesomeIcons.info,
      'text': 'How It Works',
      'url': '/howitworks',
    },
    {
      'icon': FontAwesomeIcons.question,
      'text': 'Help Center',
      'url': '/helpcenter',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: listData
            .map(
              (e) => Card(
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(e['url']);
                    },
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 60,
                          padding: EdgeInsets.all(18),
                          child: Icon(
                            e['icon'],
                            color: Theme.of(context).primaryColor,
                            size: 24,
                          ),
                        ),
                        Text(
                          e['text'],
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

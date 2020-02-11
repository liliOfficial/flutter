import 'package:flutter/material.dart';

// enum SingingCharacter { nsw, vic, sa, qld, wa, nt }

class InstoreDrawer extends StatefulWidget {
  final Function setFilter;

  InstoreDrawer(this.setFilter);
  @override
  _InstoreDrawerState createState() => _InstoreDrawerState();
}

class _InstoreDrawerState extends State<InstoreDrawer> {
  static const List<String> radioList = [
    'ALL',
    'NSW',
    'VIC',
    'SA',
    'QLD',
    'WA',
    'NT'
  ];
  String _character = '';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: radioList
              .map(
                (data) => ListTile(
                  title: Text(data),
                  leading: Radio(
                    value: data,
                    groupValue: _character,
                    onChanged: (String value) {
                      setState(() {
                        _character = value;
                        widget.setFilter(_character);
                      });
                    },
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

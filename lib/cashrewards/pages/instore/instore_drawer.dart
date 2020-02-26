import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/data/globle.dart';

class InstoreDrawer extends StatefulWidget {
  final Function setFilter;

  InstoreDrawer(this.setFilter);
  @override
  _InstoreDrawerState createState() => _InstoreDrawerState();
}

class _InstoreDrawerState extends State<InstoreDrawer> {
  static const List<String> radioList = STATES;
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

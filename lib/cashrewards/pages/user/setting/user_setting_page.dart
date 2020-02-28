import 'package:flutter/material.dart';

class UserSetting extends StatefulWidget {
  static const routeName = '/usersetting';
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Setting'),
        backgroundColor: Colors.white,
      ),
      body: Form(
        child: ListView(children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextFormField(
                decoration: InputDecoration(
              border: OutlineInputBorder(gapPadding: 0),
              suffix: Container(
                width: 60,
              ),
              labelText: 'Name',
            )),
          ),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/shared/circle_word_button.dart';

import 'user_birth_field.dart';

class UserSetting extends StatefulWidget {
  static const routeName = '/usersetting';
  @override
  _UserSettingState createState() => _UserSettingState();
}

class _UserSettingState extends State<UserSetting> {
  // final _mobileFocusNode = FocusNode();

  // @override
  // void dispose() {
  //   _mobileFocusNode.dispose();
  //   super.dispose();
  // }
  var userInfo = {
    'name': 'Li',
    'mobile': '0405000000',
    'postcode': '2067',
    'birth': '',
    'gender': 'Female'
  };

  final _form = GlobalKey<FormState>();

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) return;
    _form.currentState.save();
    print(userInfo);
  }

  void changeBirth(pickedDate) {
    setState(() {
      userInfo['birth'] = pickedDate.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Setting'),
        backgroundColor: Colors.white,
      ),
      body: Form(
        key: _form,
        child: ListView(children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(),
                  ],
                ),
                TextFormField(
                  initialValue: userInfo['name'],
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(gapPadding: 0),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                  // textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    // FocusScope.of(context).requestFocus(_mobileFocusNode);
                    _form.currentState.validate();
                  },
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: TextFormField(
                    // focusNode: _mobileFocusNode,
                    initialValue: userInfo['mobile'],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Mobile Number',
                      border: OutlineInputBorder(gapPadding: 0),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Mobile is required';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid mobile number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      userInfo['mobile'] = value;
                    },
                  ),
                ),
                TextFormField(
                  initialValue: userInfo['postcode'],
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Postcode',
                    border: OutlineInputBorder(gapPadding: 0),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Postcode is required';
                    }
                    if (double.tryParse(value) == null || value.length != 4) {
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    userInfo['postcode'] = value;
                  },
                ),
                UserBirthField(userInfo['birth'], changeBirth),
                Row(
                  children: ['Male', 'Female']
                      .map(
                        (data) => Flexible(
                          child: ListTile(
                            title: Text(data),
                            leading: Radio(
                              activeColor: Theme.of(context).primaryColor,
                              value: data,
                              groupValue: userInfo['gender'],
                              onChanged: (value) {
                                setState(() {
                                  userInfo['gender'] = value;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
                CircleWordButton(
                  icon: Icons.save,
                  text: 'Save',
                  backgroundColor: Theme.of(context).primaryColor,
                  onTap: () {
                    _saveForm();
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

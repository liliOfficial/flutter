import 'package:flutter/material.dart';

class JoinFormMobile extends StatefulWidget {
  @override
  _JoinFormMobileState createState() => _JoinFormMobileState();
}

class _JoinFormMobileState extends State<JoinFormMobile> {
  bool showCode = false;
  final _mobileController = TextEditingController();
  final _codeController = TextEditingController();

  void sendCode() {
    if (_mobileController.text != '')
      setState(() {
        showCode = true;
      });
  }

  @override
  void dispose() {
    _mobileController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(children: [
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'Phone Number'),
            keyboardType: TextInputType.number,
            controller: _mobileController,
            validator: (value) {
              if (value.isEmpty) {
                return 'Phone Number is required';
              }
              if (_codeController.text == '') {
                return 'Please send code to verifiy your number';
              }
              return null;
            },
          ),
          Positioned(
            right: 0,
            top: 10,
            child: FlatButton(
              onPressed: sendCode,
              child: Text(
                'Send code',
                style: TextStyle(color: Theme.of(context).accentColor),
              ),
            ),
          )
        ]),
        if (showCode)
          Container(
            padding: EdgeInsetsDirectional.only(top: 10),
            child: Column(
              children: <Widget>[
                Text('Enter the verification code to continue',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    )),
                TextFormField(
                  decoration: InputDecoration(labelText: '6-digit code'),
                  keyboardType: TextInputType.number,
                  controller: _codeController,
                  validator: (value) {
                    if (value.isEmpty || value.length != 6) {
                      return 'Invalid digit code';
                    }
                    setState(() {
                      _codeController.text = '';
                      showCode = false;
                    });
                    return null;
                  },
                ),
              ],
            ),
          ),
      ],
    );
  }
}

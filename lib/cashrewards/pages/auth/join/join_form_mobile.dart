import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/auth.dart';
import 'package:provider/provider.dart';

class JoinFormMobile extends StatefulWidget {
  @override
  _JoinFormMobileState createState() => _JoinFormMobileState();
}

class _JoinFormMobileState extends State<JoinFormMobile> {
  final _mobileController = TextEditingController();
  final _codeController = TextEditingController();

  @override
  void dispose() {
    _mobileController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = Provider.of<AuthProvider>(context).stepFormkeys[1];
    bool showCode = Provider.of<AuthProvider>(context).showCodeInput;

    final String backendMobileError =
        Provider.of<AuthProvider>(context).backendMobileError;

    String validateMobile(String value) {
      Pattern pattern = r'(^[0-9]{6,14}$)';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return "The mobile number you've entered is invalid.";
      else
        return null;
    }

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Stack(children: [
            TextFormField(
              autofocus: true,
              onChanged: (text) {
                Provider.of<AuthProvider>(context, listen: false)
                    .resetBackendMobileError('');
              },
              decoration: InputDecoration(
                labelText: 'Phone Number',
                errorText: backendMobileError == '' ? null : backendMobileError,
              ),
              keyboardType: TextInputType.number,
              controller: _mobileController,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Phone Number is required';
                }
                return validateMobile(value);
              },
            ),
            Positioned(
              right: 0,
              top: 10,
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Provider.of<AuthProvider>(context, listen: false)
                        .sendCode(_mobileController.text);
                  }
                },
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
                      if (!showCode) {
                        return null;
                      }
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
      ),
    );
  }
}

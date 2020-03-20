import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/auth.dart';
import 'package:provider/provider.dart';

class JoinFormEmail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String backendError =
        Provider.of<AuthProvider>(context).backendEmailError;

    String validateEmail(String value) {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value))
        return 'Enter Valid Email';
      else
        return null;
    }

    return Form(
      key: Provider.of<AuthProvider>(context).stepFormkeys[0],
      child: TextFormField(
        autofocus: true,
        onChanged: (text) {
          Provider.of<AuthProvider>(context, listen: false)
              .resetBackendEmailError('');
        },
        decoration: InputDecoration(
          labelText: 'Email Address',
          errorText: backendError == '' ? null : backendError,
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (backendError != '') {
            return backendError;
          }
          return validateEmail(value);
        },
        onSaved: (String value) {
          Provider.of<AuthProvider>(context, listen: false).emailCheck(value);
        },
      ),
    );
  }
}

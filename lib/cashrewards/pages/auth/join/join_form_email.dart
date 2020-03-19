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
      else if (backendError != '')
        return backendError;
      else
        return null;
    }

    return Form(
      key: Provider.of<AuthProvider>(context).stepFormkeys[0],
      child: TextFormField(
        autofocus: true,
        decoration: InputDecoration(labelText: 'Email Address'),
        keyboardType: TextInputType.emailAddress,
        validator: Provider.of<AuthProvider>(context).validateEmail,
        onSaved: (String value) {
          Provider.of<AuthProvider>(context, listen: false).emailCheck(value);
          // if(!response['success']) backendError = response['errors'][0]['message'];
        },
      ),
    );
  }
}

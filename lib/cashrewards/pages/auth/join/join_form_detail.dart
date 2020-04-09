import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class JoinFormDetail extends StatefulWidget {
  final formKey;
  JoinFormDetail(this.formKey);

  @override
  _JoinFormDetailState createState() => _JoinFormDetailState();
}

class _JoinFormDetailState extends State<JoinFormDetail> {

  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
            decoration: InputDecoration(labelText: 'First name'),
            controller: Provider.of<AuthProvider>(context).formDetail.firstName,
            validator: (value) {
              if (value.isEmpty) {
                return 'First name is required.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Last name'),
            controller: Provider.of<AuthProvider>(context).formDetail.lastName,
            validator: (value) {
              if (value.isEmpty) {
                return 'Last name is required.';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              labelText: 'Password (min 8 characters)',
              suffixIcon: IconButton(
                icon: _obscureText
                    ? Icon(FontAwesomeIcons.eye)
                    : Icon(FontAwesomeIcons.eyeSlash),
                onPressed: _toggleObscureText,
              ),
            ),
            controller: Provider.of<AuthProvider>(context).formDetail.password,
            validator: (value) {
              if (value.length < 8) {
                return 'Your password must be at lease 8 characters.';
              }
              return null;
            },
          ),
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(labelText: 'Password confirmation'),
            controller: Provider.of<AuthProvider>(context).formDetail.confirmPassword,
            validator: (value) {
              if (Provider.of<AuthProvider>(context).formDetail.password.value !=
                  Provider.of<AuthProvider>(context).formDetail.confirmPassword.value) {
                return 'Your passwords didn\'t match. Please Try again';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Postcode',
            ),
            keyboardType: TextInputType.number,
            controller: Provider.of<AuthProvider>(context).formDetail.postCode,
            validator: (value) {
              if (value.isEmpty || value.length != 4) {
                return 'Postcode is required.';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Promo code (Optional)'),
            controller: Provider.of<AuthProvider>(context).formDetail.promoCode,
          ),
        ],
      ),
    );
  }
}

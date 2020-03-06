import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class JoinFormDetail extends StatefulWidget {
  @override
  _JoinFormDetailState createState() => _JoinFormDetailState();
}

class _JoinFormDetailState extends State<JoinFormDetail> {
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextFormField(
          autofocus: true,
          decoration: InputDecoration(labelText: 'First name'),
          validator: (value) {
            if (value.isEmpty) {
              return 'First name is required.';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Last name'),
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
          validator: (value) {
            if (value.length < 8) {
              return 'Your password must be at lease 8 characters.';
            }
            return null;
          },
          controller: _passwordController,
        ),
        TextFormField(
          obscureText: _obscureText,
          decoration: InputDecoration(labelText: 'Password confirmation'),
          validator: (value) {
            if (_passwordController.value !=
                _passwordConfirmationController.value) {
              return 'Your passwords didn\'t match. Please Try again';
            }
            return null;
          },
          controller: _passwordConfirmationController,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Postcode',
          ),
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value.isEmpty || value.length != 4) {
              return 'Postcode is required.';
            }
            return null;
          },
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Promo code (Optional)'),
        ),
      ],
    );
  }
}

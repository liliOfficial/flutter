import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/models/http_exception.dart';
import 'package:flutter_app/cashrewards/providers/sign_in.dart';
import 'package:flutter_app/shared/color_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class SingInForm extends StatefulWidget {
  @override
  _SingInFormState createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  bool _obscureText = true;

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Form(
            key: Provider.of<SignInProvider>(context).formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(gapPadding: 0),
                    suffix: Container(
                      width: 60,
                    ),
                    labelText: 'Email Address',
                  ),
                  controller:
                      Provider.of<SignInProvider>(context).emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email is required.';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: TextFormField(
                    obscureText: _obscureText,
                    controller:
                        Provider.of<SignInProvider>(context).passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password is required.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(gapPadding: 0),
                      suffix: Container(
                        width: 60,
                      ),
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: _obscureText
                            ? Icon(FontAwesomeIcons.eye)
                            : Icon(FontAwesomeIcons.eyeSlash),
                        onPressed: _toggleObscureText,
                      ),
                    ),
                  ),
                ),
                ColorButton(
                  text: 'Sign in',
                  onPressed: () async {
                    try {
                      await Provider.of<SignInProvider>(context, listen: false)
                          .signIn();
                      Navigator.pop(context);
                    } on HttpException catch (error) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(error.toString()),
                      ));
                    } catch (error) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Could not authenticate you. Please try again later.'),
                      ));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

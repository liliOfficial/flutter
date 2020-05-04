import 'package:flutter/material.dart';

class SignInProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void signIn() {
    print('object');
  }
}
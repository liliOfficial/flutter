import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/models/http_exception.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInProvider with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;

  bool get isAuth {
    print(token != null);
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> logout() async {
    _token = null;
    _expiryDate = null;
    _userId = null;
    if (_authTimer != null) {
      _authTimer.cancel();
      _authTimer = null;
    }
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void _autoLogout() {
    if (_authTimer != null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<void> signIn() async {
    if (formKey.currentState.validate()) {
      const url =
          'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDejlOS_bICsz4fztfOW3_C_FJUO89ZnTE';
      try {
        final response = await http.post(
          url,
          body: json.encode({
            'email': emailController.value.text,
            'password': passwordController.value.text,
            'returnSecureToken': true
          }),
        );

        final responseJson = json.decode(response.body);
        print(responseJson);

        if (responseJson['error'] != null) {
          final errorRes = responseJson['error']['message'].toString();
          var errorMessage = 'Authentication failed';
          if (errorRes.contains('EMAIL_EXISTS')) {
            errorMessage = 'This email address is already in use.';
          } else if (errorRes.contains('INVALID_EMAIL')) {
            errorMessage = 'This is not a valid email address';
          } else if (errorRes.contains('WEAK_PASSWORD')) {
            errorMessage = 'This password is too weak.';
          } else if (errorRes.contains('EMAIL_NOT_FOUND')) {
            errorMessage = 'Could not find a user with that email.';
          } else if (errorRes.contains('INVALID_PASSWORD')) {
            errorMessage = 'Invalid password.';
          }

          throw HttpException(errorMessage);
        }

        print(responseJson['expiresIn']);

        _token = responseJson['idToken'];
        _userId = responseJson['localId'];
        _expiryDate = DateTime.now().add(
          Duration(
            seconds: int.parse(
              responseJson['expiresIn'],
            ),
          ),
        );

        _autoLogout();
        notifyListeners();

        final prefs = await SharedPreferences.getInstance();
        final userData = json.encode({
          'token': _token,
          'userId': _userId,
          'expiryDate': _expiryDate.toIso8601String(),
        });
        prefs.setString('userData', userData);

      } catch (error) {
        throw error;
      }
    }
  }

  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData =
        json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }

    _token = extractedUserData['token'];
    _userId = extractedUserData['userId'];
    _expiryDate = expiryDate;

    notifyListeners();
    _autoLogout();
    return true;
  }
}

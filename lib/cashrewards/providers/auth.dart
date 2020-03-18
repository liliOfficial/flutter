import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfo {
  final String firstName;
  final String lastName;
  final String email;
  final String currentPassword;
  final String postCode;
  final String mobile;
  final String otpCode;
  final String accessCode;
  final int offerSelected;

  const UserInfo({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.currentPassword = '',
    this.postCode = '',
    this.mobile = '',
    this.otpCode = '',
    this.accessCode = '',
    this.offerSelected = 0,
  });
}

class AuthProvider with ChangeNotifier {
  List<GlobalKey<FormState>> stepFormkeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];
  
  int currentStep = 0;

  List<UserInfo> userInfo;

  String email;
  String backendEmailError = '';
  String mobile;
  String otpCode;

  void emailCheck(String email) async {
    var url = 'http://localhost:7654/otp-api/email/conflict-check';

    print(email);

    var response = await http.post(url,
        body: json.encode({
          'email': email,
        }),
        headers: {
          "accept": "application/json",
          "content-type": "application/json"
        });

    var responseJson = json.decode(response.body);

    print(responseJson);

    if (!responseJson['success']) {
      backendEmailError = responseJson['errors'][0]['message'];
    } else {
      backendEmailError = '';
      currentStep = 1;
    }

    notifyListeners();

    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
  }

  void goTo(int step) {
    print(step);
    if (step < currentStep) currentStep = step;
    notifyListeners();
  }

  void cancel() {
    if (currentStep > 0) currentStep--;
    notifyListeners();
  }
}

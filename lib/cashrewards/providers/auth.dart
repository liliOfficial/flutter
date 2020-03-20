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
  static const apiUrl = 'http://localhost:7654/otp-api/';
  static const requestHeader = {
    "accept": "application/json",
    "content-type": "application/json"
  };

  List<GlobalKey<FormState>> stepFormkeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  int currentStep = 1;

  Map<String, dynamic> userInfo = {'offerSelected': 0};

  //for step 1
  String backendEmailError = '';

  void resetBackendEmailError(input) {
    backendEmailError = input;
    notifyListeners();
  }

  void emailCheck(String email) async {
    const url = apiUrl + 'email/conflict-check';

    var response = await http.post(url,
        body: json.encode({'email': email}), headers: requestHeader);

    var responseJson = json.decode(response.body);
    // print(responseJson);

    if (!responseJson['success']) {
      resetBackendEmailError(responseJson['errors'][0]['message']);
    } else {
      userInfo = {...userInfo, 'email': email};

      backendEmailError = '';
      currentStep = 1;
    }

    notifyListeners();
  }

  //step 2
  bool showCodeInput = false;
  String backendMobileError = '';

  void resetBackendMobileError(input) {
    backendMobileError = input;
    notifyListeners();
  }

  Future<void> sendCode(mobile) async {
    print(mobile);

    const url = apiUrl + 'mobile/request-otp-code';

    var response = await http.post(url,
        body: json.encode({'mobile': '+61 ' + mobile}), headers: requestHeader);

    var responseJson = json.decode(response.body);
    print(responseJson);

    if (!responseJson['success']) {
      resetBackendMobileError(responseJson['errors'][0]['message']);
    }

    notifyListeners();
  }

  //steps control
  void goTo(int step) {
    print(step);
    if (step < currentStep) currentStep = step;
    for (var i = currentStep; i < 3; i++) {
      stepFormkeys[i].currentState.reset();
    }

    notifyListeners();
  }

  void cancel() {
    if (currentStep > 0) goTo(currentStep--);
  }

  void next() {
    if (stepFormkeys[currentStep].currentState.validate()) {
      if (currentStep == 0) {
        stepFormkeys[currentStep].currentState.save();
      }
      if (currentStep == 1) {
        print(stepFormkeys[currentStep].currentWidget);
      }
      // currentStep + 1 != steps.length
      //     ? goTo(currentStep + 1)
      //     : completeForm();
    }
  }
}

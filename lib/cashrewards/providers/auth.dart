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

  //step 2 -----------------------------------
  TextEditingController mobileController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  bool showCodeInput = false;
  String backendMobileError = '';
  String backendCodeError = '';

  void resetBackendMobileError(input) {
    backendMobileError = input;
    notifyListeners();
  }

  void resetBackendCodeError(input) {
    print('=====');
    backendCodeError = input;
    notifyListeners();
  }

  Future<void> sendCode() async {
    codeController.text = '';

    String mobile = mobileController.text;
    const url = apiUrl + 'mobile/request-otp-code';

    var response = await http.post(url,
        body: json.encode({'mobile': '+61 ' + mobile}), headers: requestHeader);

    var responseJson = json.decode(response.body);
    print(responseJson);

    if (!responseJson['success']) {
      resetBackendMobileError(responseJson['errors'][0]['message']);
    } else {
      userInfo = {...userInfo, 'mobile': '+61 ' + mobile};

      showCodeInput = true;
    }
    notifyListeners();
  }

  void verifyCode() async {
    const url = apiUrl + 'mobile/verify-otp-code';
    var response = await http.post(url,
        body: json.encode(
            {'mobile': userInfo['mobile'], 'otpCode': codeController.text}),
        headers: requestHeader);

    var responseJson = json.decode(response.body);
    print(responseJson);

    if (!responseJson['success']) {
      resetBackendCodeError(responseJson['errors'][0]['message']);
    } else {
      userInfo = {...userInfo, 'otpCode': codeController.text};

      showCodeInput = false;
      backendMobileError = '';
      backendCodeError = '';
      mobileController.text = '';
      codeController.text = '';
      currentStep = 2;
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
        verifyCode();
        print(stepFormkeys[currentStep].currentWidget);
      }
      // currentStep + 1 != steps.length
      //     ? goTo(currentStep + 1)
      //     : completeForm();
    }
  }
}

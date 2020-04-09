import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserInfo {
  String firstName;
  String lastName;
  String email;
  String currentPassword;
  String postCode;
  String mobile;
  String otpCode;
  String accessCode;
  int offerSelected;

  UserInfo({
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

class DetailForm {
  TextEditingController firstName;
  TextEditingController lastName;
  TextEditingController password;
  TextEditingController confirmPassword;
  TextEditingController postCode;
  TextEditingController promoCode;

  DetailForm({
    this.firstName,
    this.lastName,
    this.password,
    this.confirmPassword,
    this.postCode,
    this.promoCode,
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

  int currentStep = 0;
  bool isLoading = false;

  void idLoadingTrue() {
    isLoading = true;
    notifyListeners();
  }

  var userInfo = UserInfo(
    offerSelected: 0,
  );

  //step 1 ================================
  String backendEmailError = '';

  void resetBackendEmailError(input) {
    backendEmailError = input;
    notifyListeners();
  }

  void emailCheck(String email) async {
    const url = apiUrl + 'email/conflict-check';

    idLoadingTrue();

    try {
      final response = await http.post(url,
          body: json.encode({'email': email}), headers: requestHeader);

      final responseJson = json.decode(response.body);
      // print(responseJson);

      if (!responseJson['success']) {
        resetBackendEmailError(responseJson['errors'][0]['message']);
      } else {
        userInfo.email = email;

        backendEmailError = '';
        currentStep = 1;
      }
    } catch (err) {
      print(err);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //step 2 ================================
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

  void initStep2() {
    showCodeInput = false;
    backendMobileError = '';
    backendCodeError = '';
    mobileController.text = '';
    codeController.text = '';
  }

  Future<void> sendCode() async {
    codeController.text = '';

    String mobile = mobileController.text;
    const url = apiUrl + 'mobile/request-otp-code';

    idLoadingTrue();

    final response = await http.post(url,
        body: json.encode({'mobile': '+61 ' + mobile}), headers: requestHeader);

    final responseJson = json.decode(response.body);
    print(responseJson);

    if (!responseJson['success']) {
      resetBackendMobileError(responseJson['errors'][0]['message']);
    } else {
      userInfo.mobile = '+61 ' + mobile;

      showCodeInput = true;
    }

    isLoading = false;
    notifyListeners();
  }

  void verifyCode() async {
    const url = apiUrl + 'mobile/verify-otp-code';

    idLoadingTrue();

    final response = await http.post(url,
        body: json.encode(
            {'mobile': userInfo.mobile, 'otpCode': codeController.text}),
        headers: requestHeader);

    final responseJson = json.decode(response.body);
    print(responseJson);

    if (!responseJson['success']) {
      resetBackendCodeError(responseJson['errors'][0]['message']);
    } else {
      userInfo.otpCode = codeController.text;

      initStep2();
      currentStep = 2;
    }

    isLoading = false;
    notifyListeners();
  }

  //step 3 ================================

  DetailForm formDetail = DetailForm(
    firstName: TextEditingController(),
    lastName: TextEditingController(),
    password: TextEditingController(),
    confirmPassword: TextEditingController(),
    postCode: TextEditingController(),
    promoCode: TextEditingController(),
  );

  Future<void> onSubmit() async {}

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

      if (currentStep == 2) {}

      // currentStep + 1 != steps.length
      //     ? goTo(currentStep + 1)
      //     : completeForm();
    }
  }
}

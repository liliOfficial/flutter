import 'package:flutter/material.dart';

import 'join_form_detail.dart';
import 'join_form_email.dart';
import 'join_form_mobile.dart';

class JoinFormSteps extends StatelessWidget {
  static final List<GlobalKey<FormState>> stepFormkeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  static String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  final List<Step> steps = [
    Step(
      title: const Text('Email for login'),
      isActive: true,
      state: StepState.complete,
      content: Column(
        children: <Widget>[
          Form(
            key: stepFormkeys[0],
            child: JoinFormEmail(),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Mobile number for security'),
      content: Form(
        key: stepFormkeys[1],
        child: JoinFormMobile(),
      ),
    ),
    Step(
      isActive: false,
      state: StepState.editing,
      title: const Text('Personal details'),
      content: Form(
        key: stepFormkeys[2],
        child: JoinFormDetail(),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

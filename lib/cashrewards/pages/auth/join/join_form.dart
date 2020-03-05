import 'package:flutter/material.dart';

import 'join_form_steps.dart';

class JoinForm extends StatefulWidget {
  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  List<Step> steps = JoinFormSteps;

  int currentStep = 0;
  bool complete = false;

  next() {
    currentStep + 1 != steps.length
        ? goTo(currentStep + 1)
        : setState(() => complete = true);
  }

  cancel() {
    if (currentStep > 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Stepper(
            steps: steps,
            currentStep: currentStep,
            onStepContinue: next,
            onStepTapped: (step) => goTo(step),
            onStepCancel: cancel,
          ),
        ),
      ),
    );
  }
}

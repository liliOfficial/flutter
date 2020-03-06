import 'package:flutter/material.dart';

import 'join_form_steps.dart';

class JoinForm extends StatefulWidget {
  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  List<Step> steps = JoinFormSteps().steps;

  int currentStep = 0;
  bool complete = false;

  next() {
    if (JoinFormSteps.stepFormkeys[currentStep].currentState.validate()) {
      currentStep + 1 != steps.length
          ? goTo(currentStep + 1)
          : setState(() => complete = true);
    }
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
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Container(
                padding: EdgeInsetsDirectional.only(top:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (currentStep != 0)
                      OutlineButton(
                        onPressed: onStepCancel,
                        child: const Text('Back'),
                      ),
                    FlatButton(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      onPressed: onStepContinue,
                      child: const Text('Next'),
                    ),
                  ],
                ),
              );
            },
            physics: ClampingScrollPhysics(),
            steps: steps,
            currentStep: currentStep,
            onStepContinue: next,
            onStepTapped: (step) {
              if (step < currentStep) goTo(step);
            },
            onStepCancel: cancel,
          ),
        ),
      ),
    );
  }
}

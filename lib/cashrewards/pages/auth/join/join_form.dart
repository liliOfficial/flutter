import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/auth.dart';
import 'package:provider/provider.dart';

import 'join_form_detail.dart';
import 'join_form_email.dart';
import 'join_form_mobile.dart';

class JoinForm extends StatefulWidget {
  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  Widget build(BuildContext context) {
    int currentStep = Provider.of<AuthProvider>(context).currentStep;

    final List<GlobalKey<FormState>> stepFormkeys =
        Provider.of<AuthProvider>(context).stepFormkeys;

    final List<Step> steps = [
      Step(
        title: const Text('Email for login'),
        isActive: true,
        state: StepState.complete,
        content: JoinFormEmail(),
      ),
      Step(
        isActive: false,
        state: StepState.editing,
        title: const Text('Mobile number for security'),
        content: JoinFormMobile(),
      ),
      Step(
        isActive: false,
        state: StepState.editing,
        title: const Text('Personal details'),
        content: JoinFormDetail(stepFormkeys[2]),
      ),
    ];

    bool complete = false;

    completeForm(constext) {
      // setState(() => complete = true);
      for (var i = 0; i < 3; i++) {
        stepFormkeys[i].currentState.reset();
      }
      Navigator.of(context).pushNamed('/');
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Stepper(
            controlsBuilder: (BuildContext context,
                {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Container(
                padding: EdgeInsetsDirectional.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (currentStep != 0)
                      OutlineButton(
                        onPressed: onStepCancel,
                        child: const Text('Back'),
                      ),
                    if (currentStep != 1 ||
                        Provider.of<AuthProvider>(context).showCodeInput)
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
            onStepContinue: () {
              Provider.of<AuthProvider>(context, listen: false).next();
            },
            onStepTapped: (step) {
              Provider.of<AuthProvider>(context, listen: false).goTo(step);
            },
            onStepCancel:
                Provider.of<AuthProvider>(context, listen: false).cancel,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/cashrewards/providers/auth.dart';
import 'package:provider/provider.dart';

import 'join_form_steps.dart';

class JoinForm extends StatefulWidget {
  @override
  _JoinFormState createState() => _JoinFormState();
}

class _JoinFormState extends State<JoinForm> {
  Widget build(BuildContext context) {
    int currentStep = Provider.of<AuthProvider>(context).currentStep;

    List<Step> steps = JoinFormSteps().steps;

    bool complete = false;

    

    completeForm() {
      // setState(() => complete = true);
      for (var i = 0; i < 3; i++) {
        JoinFormSteps.stepFormkeys[i].currentState.reset();
      }

      Navigator.of(context).pushNamed('/');
    }

    

    next() {
      Provider.of<AuthProvider>(context).stepFormkeys[currentStep].currentState.save();
      if (JoinFormSteps.stepFormkeys[currentStep].currentState.validate()) {
        if (currentStep == 1) {
          print(JoinFormSteps.stepFormkeys[currentStep].currentWidget);
        }
        // currentStep + 1 != steps.length
        //     ? goTo(currentStep + 1)
        //     : completeForm();
      }
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
              Provider.of<AuthProvider>(context, listen: false).goTo(step);
            },
            onStepCancel: Provider.of<AuthProvider>(context, listen: false).cancel,
          ),
        ),
      ),
    );
  }
}

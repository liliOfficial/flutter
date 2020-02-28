import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/cashrewards/providers/linked_card.dart';
import 'package:flutter_app/shared/color_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'card_add_term.dart';
// import 'package:flutter_card_io/flutter_card_io.dart';

class CardAddForm extends StatefulWidget {
  @override
  _CardAddFormState createState() => _CardAddFormState();
}

class _CardAddFormState extends State<CardAddForm> {
  bool _checkboxValue = false;

  final numberController = TextEditingController();
  // Map<String, dynamic> _data = {};

  // void _scanCard() async {
  //   Map<String, dynamic> details;
  //   // Platform messages may fail, so we use a try/catch PlatformException.
  //   try {
  //     details = await FlutterCardIo.scanCard({
  //       "requireExpiry": true,
  //       "scanExpiry": true,
  //       "requireCVV": true,
  //       "requirePostalCode": true,
  //       "restrictPostalCodeToNumericOnly": true,
  //       "requireCardHolderName": true,
  //       "scanInstructions": "Hola! Fit the card within the box",
  //     });
  //   } on PlatformException {
  //     print("Failed");
  //     return;
  //   }

  //   if (details == null) {
  //     print("Canceled");
  //     return;
  //   }

  //   if (!mounted) return;

  //   setState(() {
  //     _data = details;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;

    final logoImg = routeArgs['type'] == 'Visa'
        ? 'assets/images/visa.png'
        : 'assets/images/mastercard.png';

    return Column(
      children: <Widget>[
        Stack(
          children: [
            Theme(
              data: Theme.of(context)
                  .copyWith(primaryColor: Theme.of(context).accentColor),
              child: TextField(
                onChanged: (text) {
                  Provider.of<LinkedCardProvider>(context, listen: false)
                      .cardValidation(text);
                },
                controller: numberController,
                style: TextStyle(fontSize: 20),
                maxLength: 16,
                keyboardType: TextInputType.number,
                scrollPadding: EdgeInsets.all(2),
                decoration: InputDecoration(
                  border: OutlineInputBorder(gapPadding: 0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).accentColor, width: 2),
                  ),
                  suffix: Container(
                    width: 60,
                  ),
                  labelText: routeArgs['type'] + ' Card number ',
                  errorText: Provider.of<LinkedCardProvider>(context)
                          .cardNoValidated
                      ? null
                      : Provider.of<LinkedCardProvider>(context).errorMessage,
                ),
              ),
            ),
            Positioned(
              top: 18,
              right: 10,
              child: Image.asset(
                logoImg,
                height: 30,
              ),
            ),
          ],
        ),
        Container(
          child: Text(
            'OR',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: OutlineButton(
            padding: EdgeInsets.symmetric(vertical: 15),
            borderSide: BorderSide(color: Colors.grey, width: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    FontAwesomeIcons.camera,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  "Scan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: Row(
                children: <Widget>[
                  Checkbox(
                      value: _checkboxValue,
                      onChanged: (bool value) {
                        setState(() {
                          _checkboxValue = value;
                        });
                      }),
                  CardAddTerm(),
                ],
              ),
            ),
            if (!Provider.of<LinkedCardProvider>(context, listen: false).agreementValidated)
            Container(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 20),
              child: Text(
                'Please check the box to advise you have read and accepted the terms and conditions and privacy policy.',
                style: TextStyle(
                  color:Theme.of(context).errorColor
                ),
              ),
            ),
          ],
        ),
        ColorButton(
          text: 'Link Card',
          onPressed: () {
            Provider.of<LinkedCardProvider>(context, listen: false).addCard(
                numberController.text,
                _checkboxValue,
                routeArgs['type'],
                context);
          },
        ),
      ],
    );
  }
}

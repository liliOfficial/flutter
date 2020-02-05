import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CardAddForm extends StatefulWidget {
  static const checkboxText =
      'By clicking ‘Opt-in’ I agree to the Terms and Privacy Policy, and that Cashrewards may share my Mastercard card number linked to my Cashrewards account with Mastercard so that Mastercard can review my transactions and tell Cashrewards about my qualifying purchases and provide rewards. View our ';

  @override
  _CardAddFormState createState() => _CardAddFormState();
}

class _CardAddFormState extends State<CardAddForm> {
  bool _checkboxValue = false;

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
                  // errorText: 'Invalid card number',
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
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: CardAddForm.checkboxText,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                        text: 'Terms',
                        style: TextStyle(color: Colors.blue),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).pushNamed(
                                '/webview',
                                arguments: {
                                  'title': 'Terms & Conditions',
                                  'url':
                                      'https://www.cashrewards.com.au/terms-and-conditions?showheader=false&showfooter=false',
                                },
                              ),
                      ),
                      TextSpan(
                        text: ' & ',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(color: Colors.blue),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context).pushNamed(
                                '/webview',
                                arguments: {
                                  'title': 'Privacy Policy',
                                  'url':
                                      'https://www.cashrewards.com.au/privacy?showheader=false&showfooter=false',
                                },
                              ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        RaisedButton(
          color: Theme.of(context).accentColor,
          onPressed: () {},
          textColor: Colors.white,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12),
            width: double.infinity,
            child: Center(
              child: Text(
                'Link Card',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        )
      ],
    );
  }
}

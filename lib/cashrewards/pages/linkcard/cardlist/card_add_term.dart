import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CardAddTerm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final checkboxText = routeArgs['type'] == 'Visa'
        ? 'By clicking ‘Opt-in’ I agree to the Terms and Privacy Policy, and that Cashrewards may share my Visa card number linked to my Cashrewards account with Visa so that Visa can review my transactions and tell Cashrewards about my qualifying purchases and provide rewards. View our '
        : 'By clicking ‘Opt-in’ I agree to the Terms and Privacy Policy, and that Cashrewards may share my Mastercard card number linked to my Cashrewards account with Mastercard so that Mastercard can review my transactions and tell Cashrewards about my qualifying purchases and provide rewards. View our ';

    return Expanded(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: checkboxText,
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
    );
  }
}

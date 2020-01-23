import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function reset;
  Result(this.score, this.reset);

  String get resultPhrase {
    if (score >= 8) {
      return 'You are awesome';
    }
    return 'Good Luck next time';
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
      Text(
        'You have finished all the questions!',
        style: TextStyle(fontSize: 20),
      ),
      Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          
          ),
          textAlign: TextAlign.center,
      ),
      FlatButton(
        child: Text('Restart Quiz'),
        onPressed: reset,
      )
    ]);
  }
}

import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

class QuizApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: QuizHomePage(title: 'Quiz Home Page'),
    );
  }
}

class QuizHomePage extends StatefulWidget {
  QuizHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QuizHomePage> {
  int _counter = 0;
  var _questionIndex = 0;
  var _totalScore = 0;

  static const _questions = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black1', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite color111?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite color2?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4},
      ]
    },
    {
      'questionText': 'What\'s your favorite color3?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Red', 'score': 2},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 4},
      ]
    }
  ];

  void _incrementCounter() {
    setState(() {
      _counter = _counter + 3;
    });
  }

  void _answerd(int score) {
    print(_totalScore);
    if (_questionIndex < _questions.length) {
      setState(() {
        _totalScore += score;
        _questionIndex = _questionIndex + 1;
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: _questionIndex < _questions.length
              ? Quiz(
                  questions: _questions,
                  answerd: _answerd,
                  questionIndex: _questionIndex,
                )
              : Result(_totalScore,_resetQuiz)),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

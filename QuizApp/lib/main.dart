import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

//when there's only one line of code inside main
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _question = [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Red', 'score': 8},
        {'text': 'Green', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Tiger', 'score': 8},
        {'text': 'Lion', 'score': 6},
        {'text': 'Cheetah', 'score': 4},
        {'text': 'Dinosour', 'score': 5},
      ],
    },
    {
      'questionText': 'What\'s your favorite band?',
      'answers': [
        {'text': 'Radiohead', 'score': 12},
        {'text': 'Pink Floyd', 'score': 8},
        {'text': 'Linkin Park', 'score': 10},
        {'text': 'The Beatles', 'score': 4},
      ],
    },
  ];

  var _index = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _index = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _index = _index + 1;
    });

    print(_index);

    if (_index < _question.length) {
      print("We have more questions!");
    } else {
      print("No more questions!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _index < _question.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                index: _index,
                question: _question,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> question;
  final Function answerQuestion;
  final int index;

  Quiz(
      {@required this.question,
      @required this.answerQuestion,
      @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          question[index]['questionText'] as String,
        ),
        ...(question[index]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}

//questions : question
//questionIndex : index
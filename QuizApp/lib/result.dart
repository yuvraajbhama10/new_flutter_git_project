import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore <= 15) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 20) {
      resultText = 'Pretty Likeable!';
    } else if (resultScore <= 25) {
      resultText = 'You are strange!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            // style: ButtonStyle(
            //   backgroundColor: MaterialStateProperty.all(Colors.orange),
            //   foregroundColor: MaterialStateProperty.all(Colors.white),
            // ),
            style: TextButton.styleFrom(primary: Colors.redAccent),
            child: Text('Restart Quiz!', style: TextStyle(fontSize: 25)),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}

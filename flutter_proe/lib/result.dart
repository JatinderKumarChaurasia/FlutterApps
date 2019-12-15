import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(
    this.resultScore,
    this.resetHandler,
  );

  String get resultPhrase {
    String resultText = 'You Completed the quiz!!..';
    if (resultScore <= 30) {
      resultText +=
          ' and You Are Awesome. You Score - ' + resultScore.toString();
    } else {
      resultText += 'You Are Excellent. You Score - ' + resultScore.toString();
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            focusColor: Colors.amber,
            child: Text(
              'Restart',
              style: TextStyle(
                fontSize: 30,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}

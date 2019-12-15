import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}
// It can't be used in any other file that used main.dart
// putting _ in front of className makes it private
class _MyAppState extends State<MyApp> {
  // creating maps
  final _questions = const [
    {
      'questionText': 'What\'s is Your Favourite Color ? ',
      'answers': [
        {'text': 'Black', 'score': 5},
        {'text': 'Green', 'score': 10},
        {'text': 'Red', 'score': 15},
        {'text': 'Yellow', 'score': 20},
        {'text': 'Blue', 'score': 25},
      ],
    },
    {
      'questionText': 'Which City did You Born ?',
      'answers': [
        {'text': 'New Jersey', 'score': 5},
        {'text': 'Manhattan', 'score': 10},
        {'text': 'Boston', 'score': 15},
        {'text': 'London', 'score': 20},
        {'text': 'New York', 'score': 25},
        {'text': 'Sydney', 'score': 30},
        {'text': 'Beijing', 'score': 35},
      ],
    },
    {
      'questionText': 'What is Your Birthday Year ? ',
      'answers': [
        {'text': '1996', 'score': 5},
        {'text': '1997', 'score': 10},
        {'text': '1998', 'score': 15},
        {'text': '1999', 'score': 20},
        {'text': '2000', 'score': 25},
      ],
    },
    {
      'questionText': 'What is Your Best-friend\'s Name ?',
      'answers': [
        {'text': 'Ricky', 'score': 5},
        {'text': 'Anwar', 'score': 10},
        {'text': 'Lisa', 'score': 15},
        {'text': 'Brendon', 'score': 20},
        {'text': 'Vinay', 'score': 25},
        {'text': 'Joy', 'score': 30},
        {'text': 'Reynold', 'score': 35},
      ],
    },
  ];

  // private variable
  var _questionIndex = 0;
  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print('Answering Question !! : ' + _questionIndex.toString());
    print('Total Score : ' + _totalScore.toString());
    if (_questionIndex < _questions.length) {
      print('We have more questions..........');
    } else {
      print('No More Questions ... ');
    }
  }

  void _resetScore() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
//    var questions = [
//      'What\'s is Your Favourite Color ? ',
//      'Which City did You Born ?',
//      'What is Your Birthday Year ? ',
//      'What is Your Best-friend\'s Name ? '
//    ];
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text('Flutter'),
          brightness: Brightness.dark,
          titleSpacing: 20,
          leading: IconTheme(
            child: Icon(
              Icons.ac_unit,
              color: Colors.lightBlue,
            ),
            data: IconThemeData(color: Colors.black, opacity: 0.9, size: 25),
          ),
          automaticallyImplyLeading: true,
          centerTitle: true,
          textTheme: TextTheme(
            title: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex)
            : Result(
                _totalScore,
                _resetScore,
              ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

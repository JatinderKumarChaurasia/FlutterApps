import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  // positional arguments
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 28,
          color: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        softWrap: true,
        textAlign: TextAlign.center,
        locale: Locale.cachedLocale,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Function answerHandler;

  Answer(this.answerText, this.answerHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: ElevatedButton(
        child: Text(answerText),
        onPressed: answerHandler,
      ),
    );
  }
}

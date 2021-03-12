import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  final int questionIndex;
  final int totalQuestion;

  Question({
    @required this.questionText,
    @required this.questionIndex,
    @required this.totalQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Question ' +
                  questionIndex.toString() +
                  '/' +
                  totalQuestion.toString(),
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Text(
              questionText,
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ));
  }
}

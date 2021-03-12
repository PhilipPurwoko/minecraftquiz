import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> database;
  final int questionIndex;
  final Function answerHandler;

  Quiz({
    @required this.database,
    @required this.questionIndex,
    @required this.answerHandler,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(database[questionIndex]['questionText']),
        ...(database[questionIndex]['choices'] as List<String>).map((choices) {
          return Answer(choices, answerHandler);
        })
      ],
    );
  }
}

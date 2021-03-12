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
    Map<String, Object> questions = database[questionIndex]['questionItem'];
    List<String> questionList = questions['choice'];

    return Column(
      children: [
        Question(
            questionIndex: questionIndex + 1,
            questionText: database[questionIndex]['questionText'],
            totalQuestion: database.length),
        ...(questionList).map((question) {
          return Answer(question,
              () => answerHandler(question, questionList[questions['answer']]));
        })
      ],
    );
  }
}

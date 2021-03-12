import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final Function resetquiz;
  final int score;
  final int maxScore;

  Result({
    @required this.score,
    @required this.maxScore,
    @required this.resetquiz,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Column(
        children: [
          Text(
            'Final Score : ' + score.toString() + '/' + maxScore.toString(),
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: resetquiz,
            child: Text('Take Quiz Again'),
          )
        ],
      ),
    );
  }
}

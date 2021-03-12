import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<MyApp> {
  final database = const [
    {
      'questionText': 'How do you break bedrock ?',
      'questionItem': {
        'choice': [
          'Using piston glitch',
          'Using netherite pickaxe for sure',
          'No way to break bedrock',
        ],
        'answer': 0
      }
    },
    {
      'questionText': 'How do you mine a dragon egg ?',
      'questionItem': {
        'choice': [
          'Tap to collect',
          'Using torch under the egg block',
          'Mine with pickaxe'
        ],
        'answer': 1
      }
    },
    {
      'questionText': 'How to get netherite ingot ?',
      'questionItem': {
        'choice': [
          'Mine netherite ore in the nether',
          'Burn ancient debris',
          'Combine scrap with gold ingot'
        ],
        'answer': 2
      }
    }
  ];
  var _questionIndex = 0;
  var _score = 0;

  void _answerQuestion(String answer, String correctAnswer) {
    print('User Answer : ' + answer);
    print('Correct Answer : ' + correctAnswer);
    setState(() {
      if (answer == correctAnswer) {
        _score += 10;
      }
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minecraft Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text('Minecraft Quiz', textAlign: TextAlign.center),
          ),
        ),
        body: _questionIndex < database.length
            ? Quiz(
                database: database,
                answerHandler: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(
                score: _score,
                maxScore: database.length * 10,
                resetquiz: _resetQuiz,
              ),
      ),
    );
  }
}

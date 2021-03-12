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
      'choices': [
        'Using piston glitch',
        'Using netherite pickaxe for sure',
        'No way to break bedrock'
      ]
    },
    {
      'questionText': 'How do you mine a dragon egg ?',
      'choices': ['Using torch under the egg block', 'Tap to collect']
    }
  ];
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex += 1;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
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
            : Result(_resetQuiz),
      ),
    );
  }
}

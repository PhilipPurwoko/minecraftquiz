import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;
  var _questionLimit = 1;

  void _answerQuestion() {
    if (_questionIndex < _questionLimit) {
      setState(() {
        _questionIndex += 1;
      });
    } else {
      setState(() {
        _questionIndex = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'How do you break bedrock ?',
        'answer': ['Using piston glitch', 'Using netherite pickaxe for sure', 'No way to break bedrock']
      },
      {
        'questionText': 'How do you mine a dragon egg ?',
        'answer': ['Using torch under the egg block', 'Tap to collect']
      }
    ];

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
        body: Column(
          children: [
            Question(questions[_questionIndex]['questionText']),
            ...(questions[_questionIndex]['answer'] as List<String>).map((answer){
              return Answer(answer, _answerQuestion);
            })
          ],
        ),
      ),
    );
  }
}

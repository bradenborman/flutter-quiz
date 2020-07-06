import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  int _totalScore = 0;

  final List<Map<String, Object>> _questions = const [
    {
      "questionText": "What is your favorite animal?",
      "answers": [
        {"text": "Donkey", "score": 5},
        {"text": "Cow", "score": 10},
        {"text": "Cat", "score": 30},
        {"text": "Dog", "score": 50},
      ]
    },
    {
      "questionText": "How old are you?",
      "answers": [
        {"text": "10 or less", "score": 5},
        {"text": "11-33", "score": 10},
        {"text": "34-55", "score": 30},
        {"text": "55 or older", "score": 50},
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += _questionIndex + 1;
    });
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: new Scaffold(
            appBar: new AppBar(title: Text("My First App")),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result(_totalScore, _restartQuiz)));
  }
}

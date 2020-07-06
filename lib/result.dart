import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function restartQuiz;

  Result(this.score, this.restartQuiz);

  String get resultPhrase {
    String resultText = "You did it!";

    if (score > 29) {
      resultText = "You did it! Great Score";
    }
    if (score > 49) {
      resultText = "You did it! WHAT A SCORE";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(   
      children: <Widget>[
        Text(
          resultPhrase,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
        ),
        Text("Your score: " + score.toString()),
        FlatButton(
          child: Text("Restart Quiz"),
          onPressed: restartQuiz,
        )
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'QuizBrain.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();
    setState(() {
      if (correctAnswer == userAnswer) {
        scoreKeeper.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
        if (quizBrain.isFinished()) {
          Alert(
            context: context,
            title: "Finished",
            desc: "You have reach the end of the questions.",
            buttons: [
              DialogButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  onPressed: () {
                    quizBrain.resetQuestion();
                  }),
            ],
          ).show();
        } else {
          quizBrain.nextQuestion();
        }
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
        if (quizBrain.isFinished()) {
          Alert(
            context: context,
            title: "Finished",
            desc: "You have reach the end of the questions.",
            buttons: [
              DialogButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20, color: Colors.blue),
                  ),
                  onPressed: () {
                    quizBrain.resetQuestion();
                  }),
            ],
          ).show();
        } else {
          quizBrain.nextQuestion();
        }
      }
    });
  }

  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text('Quizzler'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      quizBrain.getQuestion(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    //                padding: const EdgeInsets.all(15.0),
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text(
                      'True',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      checkAnswer(true);
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FlatButton(
                    //                 padding: const EdgeInsets.all(15.0),
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      'False',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      checkAnswer(false);
                    },
                  ),
                ),
              ),
              Row(
                children: scoreKeeper,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

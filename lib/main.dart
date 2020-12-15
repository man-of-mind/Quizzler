import 'package:flutter/material.dart';

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
                      setState(() {
                        bool correctAnswer = quizBrain.getAnswer();
                        if (correctAnswer == true) {
                          scoreKeeper.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          scoreKeeper.add(Icon(
                            Icons.close,
                            color: Colors.red,
                          ));
                        }
                        quizBrain.nextQuestion();
                      });
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
                      setState(() {
                        bool correctAnswer = quizBrain.getAnswer();
                        if (correctAnswer == false) {
                          scoreKeeper.add(
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          );
                        } else {
                          scoreKeeper.add(Icon(
                            Icons.close,
                            color: Colors.red,
                          ));
                        }
                        quizBrain.nextQuestion();
                      });
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

import 'package:flutter/material.dart';

void main() {
  runApp(Quiz());
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreKeeper = [];
  List<String> questions = [
    'Node.js is a programming language.',
    'Flutter is cross-platform.',
    'A full-stack developer knows both frontend and backend engineering.'
  ];
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
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      questions.last,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.green,
                    textColor: Colors.white,
                    child: Text(
                      'True',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      setState(() {
                        scoreKeeper.add(
                          Icon(
                            Icons.check,
                            color: Colors.green,
                          ),
                        );
                      });
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FlatButton(
                    padding: const EdgeInsets.all(15.0),
                    color: Colors.red,
                    textColor: Colors.white,
                    child: Text(
                      'False',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {},
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

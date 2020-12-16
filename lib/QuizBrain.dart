import 'questions.dart';

class QuizBrain {
  int _questionNumber = 0;
  List<Question> _questionBank = [
    Question(q: 'Node.js is a programming language.', a: false),
    Question(q: 'Flutter is cross-platform.', a: true),
    Question(
        q: 'A full-stack developer knows both frontend and backend engineering.',
        a: true),
    Question(q: 'The capital state of Nigeria is Lagos', a: false),
    Question(q: 'Germany won the 2018 World Cup', a: false),
    Question(q: 'Portugal is in Europe', a: true),
    Question(q: 'Python is mainly use for data science', a: false),
    Question(q: 'Swift was built by apple.', a: true),
    Question(q: 'Chelsea plays in the La Liga league.', a: false),
    Question(q: 'Flutter is created by Google', a: true)
  ];

  void nextQuestion() {
    if (_questionNumber < (_questionBank.length - 1)) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= (_questionBank.length - 1)) {
      return true;
    } else {
      return false;
    }
  }

  void resetQuestion() {
    _questionNumber = 0;
  }

  String getQuestion() {
    return _questionBank[_questionNumber].questionText;
  }

  bool getAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }
}

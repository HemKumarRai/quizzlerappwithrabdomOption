import 'package:flutter/cupertino.dart';

import 'questions.dart';

int _questionNUmber = 0;

class QuestionBrain {
  List<Questions> _questions = [
    Questions(q: ("images/a1.jpeg"), a: true),
    Questions(q: ("images/a2.jpg"), a: false),
    Questions(q: ("images/bru.jpg"), a: false),
    Questions(q: ("images/download.jpg"), a: false),
    Questions(q: ("images/messi.jpg"), a: false),
    Questions(q: ("images/ronne.jpg"), a: false),
    Questions(q: ("images/rajesh.jpg"), a: false),

//    Questions(q: ("images/kan.jpg"), a: true),
  ];

  String getQuestionImage() {
    return _questions[_questionNUmber].image;
  }

  bool getAnswerResult() {
    return _questions[_questionNUmber].answerResult;
  }

  void nextQuestion() {
    if (_questionNUmber < _questions.length - 1) {
      _questionNUmber++;
    }
  }

  void reset() {
    _questionNUmber = 0;
  }

  bool isFinished() {
    if (_questionNUmber < _questions.length - 1) {
      return false;
    } else {
      return true;
    }
  }
}

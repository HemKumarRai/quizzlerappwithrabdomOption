//import 'package:flutter/cupertino.dart';

import 'questions.dart';
import 'main.dart';

int _questionNUmber = 0;

class QuestionBrain {
  List<Questions> _questions = [
    Questions(q: ("images/a1.jpeg"), a: 0, o: ["Neymar", "M`Bappe", "Ronaldo"]),
    Questions(q: ("images/a2.jpg"), a: 0, o: ["Neymar", "Messi", "Ronaldo"]),
    Questions(
        q: ("images/bru.jpg"), a: 2, o: ["Jet Li", "Jacky Chan", "Bruce Lee"]),
    Questions(
        q: ("images/download.jpg"),
        a: 1,
        o: ["Paras", "Prithvi Narayan Shah", "King Albert"]),
    Questions(
      q: ("images/messi.jpg"),
      a: 1,
      o: ["Neymar", "Messi", "Ronaldo"],
    ),
    Questions(
        q: ("images/ronne.jpg"),
        a: 2,
        o: ["Neymar Jr.", "L.Messi", "Cr.Ronaldo"]),
    Questions(
        q: ("images/rajesh.jpg"),
        a: 0,
        o: ["Rajesh Hamal", "Bhuwan Kc", "Anamol KC"]),
    Questions(
        q: ("images/blbdr.jpg"),
        a: 1,
        o: ["KP Oli", "Balbhadra Kunwar", "Sacar"]),
    Questions(
        q: ("images/klmn.jpg"),
        a: 2,
        o: ["Sherbahadur Deuwa", "LaxmiPrasad Devkota", "KulMan Ghising"]),
    Questions(
        q: ("images/psnlhmu.jpg"),
        a: 0,
        o: ["PasangLhamu Sherpa", "Bidhya Bhandaari", "Priyanka Karki"]),
    Questions(
        q: ("images/ronaldinho.jpg"),
        a: 2,
        o: ["`Zidane", "Messi", "Ronaldiho"]),
    Questions(
        q: ("images/sanduk ruit.jpg"),
        a: 0,
        o: ["Sanduk Ruit", "Puspakamal Dahal", "Sagar Thapa"]),
    Questions(q: ("images/ylmbr.jpg"), a: 0, o: [
      "Yalambar (First ever king of Kirant)",
      "Bhakti Thapa",
      "Prachanda"
    ]),

//    Questions(q: ("images/kan.jpg"), a: true),
  ];

  String getQuestionImage() {
    return _questions[_questionNUmber].image;
  }

  List<String> getQuestionOptions() {
    return _questions[_questionNUmber].options;
  }

  int getAnswerResult() {
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

  String knowAnswer() {
    if (questionBrain.getAnswerResult() == 0) {
      return ("Your Answer Is (a)");
    } else if (questionBrain.getAnswerResult() == 1) {
      return ("Your Answer Is (b)");
    } else {
      return ("Your Answer Is (c)");
    }
  }
}

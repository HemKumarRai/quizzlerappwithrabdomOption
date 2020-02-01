import 'package:flutter/material.dart';
import 'package:face_recognition_app/question_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'result_page.dart';

QuestionBrain questionBrain = new QuestionBrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

int questionNUmber = 0;
int score = 0;

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scorekeeper = [];
  List<String> options = questionBrain.getQuestionOptions();
  Color culor = Colors.blue;

  void checkAnswer(int userAnswer) {
    setState(() {
      if (questionBrain.isFinished()) {
        Alert(
                context: context,
                title: "Faces are finished",
                desc: "The Total no of Questions Finished"
                    "Your Score is: $score/$questionNUmber")
            .show();
        questionBrain.reset();
        scorekeeper.clear();
        score = 0;
      } else {
        if (questionBrain.getAnswerResult() == userAnswer) {
          scorekeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          score++;
          culor = Colors.green;
          questionNUmber++;
        } else {
          scorekeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          questionBrain.knowAnswer();
          culor = Colors.red;
          questionNUmber++;
        }
        questionBrain.nextQuestion();
        options = questionBrain.getQuestionOptions();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Image.asset(questionBrain.getQuestionImage()),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Score:$score",
                  style: TextStyle(
                    color: Colors.black,
                    backgroundColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(),
                  ));
            },
            child: Container(
              height: 30.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Display Answer",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      backgroundColor: Colors.cyanAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: culor,
              child: Text(
                options[0],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(0);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: culor,
              child: Text(
                options[1],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(1);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: FlatButton(
              color: culor,
              child: Text(
                options[2],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(2);
              },
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: scorekeeper,
          ),
        ),
      ],
    );
  }
}

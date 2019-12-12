import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzler/quiz_brain.dart';

var quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreBoardList = [];

  int questionNumber = 0;

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
              child: Text(
                quizBrain.questions[questionNumber].question,
                textAlign: TextAlign.center,
                style: GoogleFonts.magra(fontSize: 25.0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                evaluateCorrectAnswer(
                    quizBrain.questions[questionNumber].answer, true);

                //The user picked true.
                setState(() {
                  questionNumber =
                  questionNumber == quizBrain.questions.length - 1
                      ? 0
                      : questionNumber + 1;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                evaluateCorrectAnswer(
                    quizBrain.questions[questionNumber].answer, false);
                setState(() {
                  questionNumber =
                  questionNumber == quizBrain.questions.length - 1
                      ? 0
                      : questionNumber + 1;
                });
              },
            ),
          ),
        ),
        Row(
          children: scoreBoardList,
        )
      ],
    );
  }

  void evaluateCorrectAnswer(bool correctAnswer, bool clickedValue) {
    if (correctAnswer == clickedValue) {
      scoreBoardList.add(Icon(
        Icons.check,
        color: Colors.green,
      ));
    } else {
      scoreBoardList.add(Icon(
        Icons.close,
        color: Colors.red,
      ));
    }
  }
}

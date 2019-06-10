import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quizzler/src/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

final _quizBrain = QuizBrain();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final _scoreKeeper = <Icon>[];

  _handleUserAnswer(bool answer) {
    if (_quizBrain.isFinished()) {
      Alert(
        context: context,
        title: 'Finished!',
        content: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            'You\'ve reached the end of the quiz.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        buttons: [
          DialogButton(
            child: Text(
              'CANCEL',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            onPressed: () {
              setState(() {
                _scoreKeeper.clear();
                _quizBrain.reset();
                Navigator.pop(context);
              });
            },
          ),
        ],
      ).show();
    } else {
      final correctAnswer = _quizBrain.getQuestionAnswer();

      setState(() {
        if (answer == correctAnswer) {
          _scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          _scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        _quizBrain.getNextQuestion();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text(
                _quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                _handleUserAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                _handleUserAnswer(false);
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: Row(
            children: _scoreKeeper,
          ),
        )
      ],
    );
  }
}

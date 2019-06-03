import 'dart:math';

import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int _ballNumber = 1;

  final _rand = Random();

  void _askBall() {
    setState(() {
      _ballNumber = _rand.nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlatButton(
        onPressed: () {
          _askBall();
        },
        child: Image.asset('images/ball$_ballNumber.png'),
      ),
    );
  }
}

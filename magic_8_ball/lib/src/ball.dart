import 'package:flutter/material.dart';

class Ball extends StatefulWidget {
  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('images/ball1.png'),
    );
  }
}

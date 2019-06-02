import 'package:flutter/material.dart';

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image(
            image: AssetImage("images/dice1.png"),
          ),
        ),
        Expanded(
          child: Image(
            image: AssetImage("images/dice1.png"),
          ),
        ),
      ],
    );
  }
}

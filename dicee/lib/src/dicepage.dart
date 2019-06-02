import 'package:flutter/material.dart';

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image.asset("images/dice1.png"),
        ),
        Expanded(
          child: Image.asset("images/dice1.png"),
        ),
      ],
    );
  }
}

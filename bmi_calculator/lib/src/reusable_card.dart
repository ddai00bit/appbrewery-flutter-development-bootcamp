import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;
  final Widget child;
  final Function onPress;

  ReusableCard({@required this.backgroundColor, this.onPress, this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}

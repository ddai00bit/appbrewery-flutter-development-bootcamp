import 'package:flutter/material.dart';

const _bottomContainerHeight = 80.0;
const _bottomContainerColor = Color(0xFFEB1555);
const _activeCardColor = Color(0xFF1D1E33);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    backgroundColor: _activeCardColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    backgroundColor: _activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              backgroundColor: _activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    backgroundColor: _activeCardColor,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    backgroundColor: _activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: _bottomContainerColor,
            margin: EdgeInsets.only(top: 10),
            child: Text(''),
            width: double.infinity,
            height: _bottomContainerHeight,
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Color backgroundColor;

  ReusableCard({@required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

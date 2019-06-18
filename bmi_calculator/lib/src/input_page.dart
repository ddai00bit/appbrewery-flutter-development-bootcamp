import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const _bottomContainerHeight = 80.0;
const _bottomContainerColor = Color(0xFFEB1555);
const _activeCardColor = Color(0xFF1D1E33);
const _inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color _maleCardColor = _inactiveCardColor;
  Color _femaleCardColor = _inactiveCardColor;

  _updateColor(int gender) {
    if (gender == 1) {
      if (_maleCardColor == _inactiveCardColor) {
        _maleCardColor = _activeCardColor;
        _femaleCardColor = _inactiveCardColor;
      } else {
        _maleCardColor = _inactiveCardColor;
      }
    } else if (gender == 2) {
      if (_femaleCardColor == _inactiveCardColor) {
        _femaleCardColor = _activeCardColor;
        _maleCardColor = _inactiveCardColor;
      } else {
        _femaleCardColor = _inactiveCardColor;
      }
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _updateColor(1);
                      });
                    },
                    child: ReusableCard(
                      backgroundColor: _activeCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _updateColor(2);
                      });
                    },
                    child: ReusableCard(
                      backgroundColor: _activeCardColor,
                      child: IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
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

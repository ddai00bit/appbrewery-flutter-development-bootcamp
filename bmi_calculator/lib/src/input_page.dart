import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const _bottomContainerHeight = 80.0;
const _bottomContainerColor = Color(0xFFEB1555);
const _activeCardColor = Color(0xFF1D1E33);
const _inactiveCardColor = Color(0xFF111328);

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender _selectedGender;

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
                    backgroundColor: _selectedGender == Gender.male
                        ? _activeCardColor
                        : _inactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ReusableCard(
                    backgroundColor: _selectedGender == Gender.female
                        ? _activeCardColor
                        : _inactiveCardColor,
                    child: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    onPress: () {
                      setState(() {
                        _selectedGender = Gender.female;
                      });
                    },
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

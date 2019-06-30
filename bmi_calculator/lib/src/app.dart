import 'package:flutter/material.dart';

import 'screens/input_page.dart';

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E22),
        scaffoldBackgroundColor: Color(0xFF0A0E22),
      ),
      home: InputPage(),
    );
  }
}

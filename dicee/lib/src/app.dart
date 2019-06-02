import 'package:flutter/material.dart';

import 'dicepage.dart';

class DiceeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        backgroundColor: Colors.red,
        body: DicePage(),
      ),
    );
  }
}

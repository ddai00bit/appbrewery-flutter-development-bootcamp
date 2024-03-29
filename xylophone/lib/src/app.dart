import 'package:flutter/material.dart';

typedef void PlayNoteHandler(String note);

class XylophoneApp extends StatelessWidget {
  final Map<Color, String> _notes = {
    Colors.red: "note1.wav",
    Colors.orange: "note2.wav",
    Colors.yellow: "note3.wav",
    Colors.lightGreen: "note4.wav",
    Colors.green: "note5.wav",
    Colors.blue: "note6.wav",
    Colors.purple: "note7.wav",
  };
  final PlayNoteHandler playNoteHandler;

  XylophoneApp({
    Key key,
    this.playNoteHandler,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _buildKeys(),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildKeys() {
    return _notes.keys.map((color) => _buildKey(color, _notes[color])).toList();
  }

  Widget _buildKey(Color color, String note) {
    return Expanded(
      child: FlatButton(
        color: color,
        onPressed: () {
          playNoteHandler(note);
        },
      ),
    );
  }
}

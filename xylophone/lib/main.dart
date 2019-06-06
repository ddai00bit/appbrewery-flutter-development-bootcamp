import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

import 'src/app.dart';

final player = AudioCache();

void main() => runApp(
      XylophoneApp(
        playNoteHandler: (note) {
          player.play(note);
        },
      ),
    );

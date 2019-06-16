import 'package:destini/src/story_brain.dart';
import 'package:flutter/material.dart';

import 'story_page.dart';

final _storyBrain = StoryBrain();

class DestiniApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(
        storyBrain: _storyBrain,
      ),
    );
  }
}

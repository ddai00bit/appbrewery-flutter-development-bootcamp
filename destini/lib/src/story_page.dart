import 'package:flutter/material.dart';

import 'story_brain.dart';

class StoryPage extends StatefulWidget {
  final StoryBrain storyBrain;

  StoryPage({Key key, @required this.storyBrain}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 15,
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    widget.storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      widget.storyBrain.nextStory(1);
                    });
                  },
                  color: Colors.red,
                  child: Text(
                    widget.storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: Visibility(
                  visible: widget.storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        widget.storyBrain.nextStory(2);
                      });
                    },
                    color: Colors.blue,
                    child: Text(
                      widget.storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

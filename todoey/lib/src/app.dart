import 'package:flutter/material.dart';
import 'package:todoey/src/screens/tasks_screen.dart';

class TodoeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todoey',
      home: TasksScreen(),
    );
  }
}

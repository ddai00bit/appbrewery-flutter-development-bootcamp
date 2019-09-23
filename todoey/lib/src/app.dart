import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/src/models/task_data.dart';
import 'package:todoey/src/screens/tasks_screen.dart';

class TodoeyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        title: 'Todoey',
        home: TasksScreen(),
      ),
    );
  }
}

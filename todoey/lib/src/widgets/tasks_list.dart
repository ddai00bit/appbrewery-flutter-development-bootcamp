import 'package:flutter/material.dart';
import 'package:todoey/src/models/task.dart';
import 'package:todoey/src/widgets/task_tile.dart';

class TasksList extends StatefulWidget {
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  final List<Task> tasks = [
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
    Task(name: 'Buy milk'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            title: tasks[index].name,
            isChecked: tasks[index].isDone,
            onChecked: (newValue) {
              setState(() {
                tasks[index].toggleDone();
              });
            });
      },
      itemCount: tasks.length,
    );
  }
}

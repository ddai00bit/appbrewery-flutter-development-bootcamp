import 'package:flutter/material.dart';
import 'package:todoey/src/models/task.dart';
import 'package:todoey/src/widgets/task_tile.dart';

typedef TaskCheckedCallback = void Function(int index, bool isChecked);

class TasksList extends StatelessWidget {
  final List<Task> tasks;
  final TaskCheckedCallback onChecked;

  TasksList({
    @required this.tasks,
    @required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
          title: tasks[index].name,
          isChecked: tasks[index].isDone,
          onChecked: (newValue) => onChecked(index, newValue),
        );
      },
      itemCount: tasks.length,
    );
  }
}

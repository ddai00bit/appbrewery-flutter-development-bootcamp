import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/src/models/task.dart';
import 'package:todoey/src/models/task_data.dart';
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
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              title: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              onChecked: (newValue) => onChecked(index, newValue),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}

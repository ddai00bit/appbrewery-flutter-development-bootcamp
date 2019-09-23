import 'package:flutter/material.dart';

typedef CheckboxCallback = void Function(bool newValue);

class TaskTile extends StatelessWidget {
  final String title;
  final bool isChecked;
  final CheckboxCallback onChecked;
  final GestureLongPressCallback onLongPress;

  TaskTile({
    @required this.title,
    @required this.isChecked,
    @required this.onChecked,
    @required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        title,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: onChecked,
      ),
    );
  }
}

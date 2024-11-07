// stateful_tab.dart
import 'package:flutter/material.dart';
import 'task.dart';

class StatefulTab extends StatefulWidget {
  @override
  _StatefulTabState createState() => _StatefulTabState();
}

class _StatefulTabState extends State<StatefulTab> {
  final List<Task> _tasks = [];

  void _addTask(String title) {
    setState(() {
      _tasks.add(Task(title: title));
    });
  }

  void _toggleTaskCompletion(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TaskScreen(tasks: _tasks, addTask: _addTask, toggleTaskCompletion: _toggleTaskCompletion);
  }
}

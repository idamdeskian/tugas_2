// provider_tab.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'task.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title: title));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}

class ProviderTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return TaskScreen(
            tasks: taskProvider.tasks,
            addTask: taskProvider.addTask,
            toggleTaskCompletion: taskProvider.toggleTaskCompletion,
          );
        },
      ),
    );
  }
}

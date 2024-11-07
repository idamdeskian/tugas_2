// task_screen.dart
import 'package:flutter/material.dart';
import 'task.dart';

class TaskScreen extends StatelessWidget {
  final List<Task> tasks;
  final Function(String) addTask;
  final Function(int) toggleTaskCompletion;

  TaskScreen({required this.tasks, required this.addTask, required this.toggleTaskCompletion});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'New Task'),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                addTask(value);
                controller.clear();
              }
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(tasks[index].title),
                trailing: Checkbox(
                  value: tasks[index].isCompleted,
                  onChanged: (_) => toggleTaskCompletion(index),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

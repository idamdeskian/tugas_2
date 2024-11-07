// riverpod_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'task.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) => TaskNotifier());

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Task(title: title)];
  }

  void toggleTaskCompletion(int index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index) state[i].copyWith(isCompleted: !state[i].isCompleted) else state[i]
    ];
  }
}

class RiverpodTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return TaskScreen(
      tasks: tasks,
      addTask: (title) => ref.read(taskProvider.notifier).addTask(title),
      toggleTaskCompletion: (index) => ref.read(taskProvider.notifier).toggleTaskCompletion(index),
    );
  }
}

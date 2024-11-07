// bloc_tab.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task.dart';
import 'task_bloc.dart';

class BlocTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: BlocBuilder<TaskBloc, List<Task>>(
        builder: (context, tasks) {
          return TaskScreen(
            tasks: tasks,
            addTask: (title) => context.read<TaskBloc>().add(AddTaskEvent(title)),
            toggleTaskCompletion: (index) => context.read<TaskBloc>().add(ToggleTaskEvent(index)),
          );
        },
      ),
    );
  }
}

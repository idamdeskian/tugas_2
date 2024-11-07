// getx_tab.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'task.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(String title) {
    tasks.add(Task(title: title));
  }

  void toggleTaskCompletion(int index) {
    tasks[index].isCompleted = !tasks[index].isCompleted;
    tasks.refresh();
  }
}

class GetXTab extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TaskScreen(
        tasks: taskController.tasks,
        addTask: taskController.addTask,
        toggleTaskCompletion: taskController.toggleTaskCompletion,
      ),
    );
  }
}

// task.dart
class Task {
  String title;
  bool isCompleted;

  Task({required this.title, this.isCompleted = false});

  // Copy method untuk kemudahan dalam perubahan state di beberapa state management seperti Riverpod
  Task copyWith({String? title, bool? isCompleted}) {
    return Task(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

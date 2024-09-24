import 'package:planify/models/status_enum.dart';

List<Task> tasks = [
  Task(id: "1", title: "title", subtitle: "subtitle"),
];

class Task {
  String? id;
  String? title;
  String? subtitle;
  List<SubTask>? subtasks;
  String? category;
  DateTime? dateTime;
  bool isDone = false;
  TaskStatus? status;
  bool? isDailyTask;
  Task({
    required this.id,
    required this.title,
    this.subtitle,
    this.subtasks,
    this.category,
    this.dateTime,
    this.status,
    this.isDailyTask,
  });
}

class SubTask {
  String? id;
  String? title;
  String? subtitle;
  DateTime? dateTime;
  TaskStatus? status;
  SubTask({
    required this.id,
    required this.title,
    this.subtitle,
    this.dateTime,
    this.status,
  });
}

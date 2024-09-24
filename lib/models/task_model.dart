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

  // Convert a Task object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'subtasks': subtasks?.map((subtask) => subtask.toJson()).toList(),
      'category': category,
      'dateTime': dateTime?.toIso8601String(),
      'isDone': isDone,
      'status': status?.toString(),
      'isDailyTask': isDailyTask,
    };
  }

  // Create a Task object from a JSON map
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((item) => SubTask.fromJson(item))
          .toList(),
      category: json['category'],
      dateTime:
          json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
      status: json['status'] != null
          ? TaskStatus.values.firstWhere((e) => e.toString() == json['status'])
          : null,
      isDailyTask: json['isDailyTask'],
    )..isDone = json['isDone'] ?? false;
  }
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'subtitle': subtitle,
      'dateTime': dateTime?.toIso8601String(),
      'status': status?.toString(),
    };
  }

  // Create a SubTask object from a JSON map
  factory SubTask.fromJson(Map<String, dynamic> json) {
    return SubTask(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      dateTime:
          json['dateTime'] != null ? DateTime.parse(json['dateTime']) : null,
      status: json['status'] != null
          ? TaskStatus.values.firstWhere((e) => e.toString() == json['status'])
          : null,
    );
  }
}

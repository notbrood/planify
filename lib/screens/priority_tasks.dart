import 'package:flutter/material.dart';
import 'package:planify/models/task_model.dart';

class PriorityTasksScreen extends StatefulWidget {
  const PriorityTasksScreen({super.key});

  @override
  State<PriorityTasksScreen> createState() => _PriorityTasksScreenState();
}

class _PriorityTasksScreenState extends State<PriorityTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Priority Tasks"),
        centerTitle: true,
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          return ListTile(
            leading: Checkbox(
                value: tasks[i].isDone,
                onChanged: (val) {
                  setState(
                    () {
                      tasks[i].isDone = val!;
                    },
                  );
                }),
            tileColor: Colors.grey.shade200,
            title: Text(tasks[i].title ?? "no Title"),
            subtitle:
                tasks[i].subtitle != null ? Text(tasks[i].subtitle!) : null,
            trailing: PopupMenuButton(
              itemBuilder: (ctx) => [
                PopupMenuItem(
                  child: Text("edit"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

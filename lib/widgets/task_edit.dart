import 'package:flutter/material.dart';
import 'package:planify/models/task_model.dart';

TextEditingController titleController = TextEditingController();
TextEditingController subtitleController = TextEditingController();
TextEditingController categoryController = TextEditingController();

showDialogBox({required BuildContext context, int? taskIndex}) {
  showDialog(
    context: context,
    builder: (context) => Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            taskIndex != null ? "Edit Task" : "Add Task",
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text("title: "),
              Expanded(
                child: TextField(
                  controller: titleController,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text("subtitle: "),
              Expanded(
                  child: TextField(
                controller: subtitleController,
              )),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Text("category: "),
              Expanded(
                child: TextField(
                  controller: categoryController,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              tasks.add(
                Task(
                  title: titleController.text,
                  id: (tasks.length + 1).toString(),
                  category: categoryController.text,
                  subtitle: subtitleController.text,
                ),
              );
              Navigator.pop(context);
            },
            child: Text("add task"),
          )
        ],
      ),
    ),
  );
}

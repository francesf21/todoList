import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_02_agenda/data.dart';
import 'package:sp_02_agenda/widgets/task_tile.dart';

class TaskList extends StatefulWidget {
  final double screenHeight;

  const TaskList({
    super.key,
    required this.screenHeight,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    Consumer consumer = Consumer<Data>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(
            vertical: widget.screenHeight * 0.08,
            horizontal: widget.screenHeight * 0.07,
          ),
          itemCount: taskData.tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(
              taskName: taskData.tasks[index].taskName,
              checked: taskData.tasks[index].isDone,
              index: index,
            );
          },
        );
      },
    );
    return consumer;
  }
}

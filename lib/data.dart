import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sp_02_agenda/models/task.dart';

class Data extends ChangeNotifier {
  List<Task> _taskList = [];

  Data(this._taskList);

  Data.fromMap(Map<String, dynamic> map) {
    List<dynamic> list = map['taskList'];
    for (int i = 0; i < list.length; i++) {
      _taskList.add(
        Task(
          taskName: list[i]['taskName'],
          isDone: list[i]['isDone'],
        ),
      );
    }
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> taskList = _taskList
        .map(
          (e) => e.toMap(),
        )
        .toList();
    return {'taskList': taskList};
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_taskList);
  }

  void addTask(newTaskName) async {
    _taskList.add(Task(taskName: newTaskName));
    notifyListeners();
  }

  void toggleChecked(value, index) {
    _taskList[index].isDone = value;
    notifyListeners();
  }

  void deleteTask(index) {
    _taskList.removeAt(index);
    notifyListeners();
  }
}

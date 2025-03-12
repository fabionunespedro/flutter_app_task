import 'package:flutter/material.dart';
import 'package:flutter_app_task/data/task_dao.dart';
import 'package:flutter_app_task/model/task_model.dart';

class TaskController extends ValueNotifier<List<TaskModel>> {
  TaskController() : super([]) {
    _loadTasks();
  }

  final TaskDao _dao = TaskDao();

  Future<void> _loadTasks() async {
    value = await _dao.findAll();
  }

  Future<void> addNewTask(String name, String image, int difficulty) async {
    final newTask = TaskModel(
      name: name,
      image: image,
      difficulty: difficulty,
    );

    await _dao.save(newTask);
    await _loadTasks();
  }

  Future<void> removeTask(String name) async {
    await _dao.delete(name);
    await _loadTasks();
  }

  Future<void> clearAllTasks() async {
    await _dao.clearAll();
    await _loadTasks();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_task/widgets/task_widget.dart';

class TaskController extends ValueNotifier<List<TaskWidget>> {
  TaskController()
      : super([
          TaskWidget(
            nameTask: "Farm in Dragon Valley",
            imageTask: "assets/img/dragonValley.jpg",
            difficultyTask: 5,
          ),
          TaskWidget(
            nameTask: "Farm in Toi 4",
            imageTask: "assets/img/toi.png",
            difficultyTask: 3,
          )
        ]);

  void addNewTask(String name, String image, int difficulty) {
    value = [...value, TaskWidget(nameTask: name, imageTask: image, difficultyTask: difficulty)];
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app_task/controller/task_controller.dart';
import 'package:flutter_app_task/model/task_model.dart';
import 'package:flutter_app_task/screens/add_task_page.dart';
import 'package:flutter_app_task/widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TaskController controller = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("App Task for Lineage 2"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.black),
            onPressed: () async {
              final confirm = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Excluir todas as tarefas?"),
                  content: const Text("Essa ação não pode ser desfeita."),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text("Excluir", style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              );

              if (confirm == true) {
                controller.clearAllTasks();
              }
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<TaskModel>>(
        valueListenable: controller,
        builder: (context, taskList, child) {
          return ListView.builder(
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return TaskWidget(
                nameTask: task.name,
                imageTask: task.image,
                difficultyTask: task.difficulty,
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTaskPage()),
          );

          if (result is Map<String, dynamic>) {
            controller.addNewTask(
              result['name'],
              result['image'],
              result['difficulty'],
            );
          }
        },
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}

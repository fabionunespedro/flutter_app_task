import 'package:flutter/material.dart';
import 'package:flutter_app_task/controller/task_controller.dart';
import 'package:flutter_app_task/screens/add_task_page.dart';

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
        leading: Container(),
        backgroundColor: Colors.amber,
        title: const Text("App Task for Lineage 2"),
      ),
      body: Container(
        color: Colors.white10,
        child: ValueListenableBuilder<List>(
          valueListenable: controller,
          builder: (context, taskList, child) {
            return ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                return taskList[index];
              },
            );
          },
        ),
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

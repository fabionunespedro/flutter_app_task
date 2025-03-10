import 'package:flutter_app_task/widgets/task_widget.dart';

class TaskDao {
  static const String tablesql = 'CREATE TABLE $_tablename('
      '$_name TEXT, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(TaskWidget tarefa) async {}
  //Future<List<TaskWidget>> findAll()async{}
  //Future<List<TaskWidget>> find(String nomeDaTarefa) async{}
  delete(String nomeDaTarefa) async {}
}

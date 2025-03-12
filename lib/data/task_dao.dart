import 'package:flutter_app_task/data/database.dart';
import 'package:flutter_app_task/model/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = '''
    CREATE TABLE $_tableName (
      $_name TEXT PRIMARY KEY,
      $_image TEXT,
      $_difficulty INTEGER
    )
  ''';

  static const String _tableName = 'taskTable';
  static const String _name = 'name';
  static const String _image = 'image';
  static const String _difficulty = 'difficulty';

  Future<void> save(TaskModel task) async {
    final Database db = await getDatabase();
    var existingTask = await find(task.name);

    if (existingTask == null) {
      await db.insert(_tableName, task.toMap());
    } else {
      await db.update(
        _tableName,
        task.toMap(),
        where: '$_name = ?',
        whereArgs: [task.name],
      );
    }
  }

  Future<List<TaskModel>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    return result.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<TaskModel?> find(String taskName) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );

    if (result.isNotEmpty) {
      return TaskModel.fromMap(result.first);
    }
    return null;
  }

  Future<void> delete(String taskName) async {
    final Database db = await getDatabase();
    await db.delete(
      _tableName,
      where: '$_name = ?',
      whereArgs: [taskName],
    );
  }

  Future<void> clearAll() async {
    final Database bancoDeDados = await getDatabase();
    await bancoDeDados.delete(_tableName);
  }
}

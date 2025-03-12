import 'package:flutter_app_task/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(
    path,
    version: 1,
    onCreate: (db, version) {
      db.execute(TaskDao.tableSql);
    },
    onUpgrade: (db, oldVersion, newVersion) {
      db.execute("DROP TABLE IF EXISTS taskTable");
      db.execute(TaskDao.tableSql);
    },
  );
}

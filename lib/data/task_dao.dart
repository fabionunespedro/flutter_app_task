import 'package:flutter_app_task/data/database.dart';
import 'package:flutter_app_task/widgets/task_widget.dart';
import 'package:sqflite/sqflite.dart';

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
  Future<List<TaskWidget>> findAll() async {
    print("Acessando o findAll: ");
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados.query(_tablename);
    print("Procurando dados no banco de dados... encontrando: $result");
    return toList(result);
  }

  List<TaskWidget> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print("Convertendo to List: ");
    final List<TaskWidget> tarefas = [];
    for (Map<String, dynamic> linha in mapaDeTarefas) {
      final TaskWidget tarefa = TaskWidget(
          nameTask: linha[_name], imageTask: linha[_image], difficultyTask: linha[_difficulty]);
      tarefas.add(tarefa);
    }
    print("Lista de Tarefas $tarefas");
    return tarefas;
  }

  //Future<List<TaskWidget>> find(String nomeDaTarefa) async{}
  delete(String nomeDaTarefa) async {}
}

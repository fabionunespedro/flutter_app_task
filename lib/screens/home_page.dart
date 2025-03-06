import 'package:flutter/material.dart';
import 'package:flutter_app_task/widgets/task_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        backgroundColor: Colors.amber,
        title: const Text("App Task for Lineage 2"),
      ),
      body: Container(
        color: Colors.black38,
        child: ListView(
          children: const <Widget>[
            Column(
              children: <Widget>[
                TaskWidget(
                  nameTask: "Farm in Dragon Valley",
                  imageTask: "assets/img/dragonValley.jpg",
                  difficultyTask: 5,
                ),
                TaskWidget(
                  nameTask: "Farm in Toi 4",
                  imageTask: "assets/img/toi.png",
                  difficultyTask: 3,
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
    );
  }
}

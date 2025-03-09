import 'package:flutter/material.dart';
import 'package:flutter_app_task/widgets/difficulty_widget.dart';

class TaskWidget extends StatefulWidget {
  final String nameTask;
  final String imageTask;
  final int difficultyTask;

  const TaskWidget({
    super.key,
    required this.nameTask,
    required this.imageTask,
    required this.difficultyTask,
  });

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  int level = 0;

  Image buildImage(String path) {
    if (path.startsWith("http") || path.startsWith("https")) {
      return Image.network(
        path,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Image.asset("assets/img/error.png", fit: BoxFit.cover);
        },
      );
    } else {
      return Image.asset(path, fit: BoxFit.cover);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 140,
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: buildImage(widget.imageTask),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.nameTask,
                          style: const TextStyle(color: Colors.black, fontSize: 16),
                        ),
                        DifficultyWidget(
                          difficultyColors: widget.difficultyTask,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              level++;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.arrow_circle_up, color: Colors.black),
                              Text('UP', style: TextStyle(color: Colors.black)),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        value:
                            (widget.difficultyTask > 0) ? (level / widget.difficultyTask) / 10 : 1,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text("Level: $level"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

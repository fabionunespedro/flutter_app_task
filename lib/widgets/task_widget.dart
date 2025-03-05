import 'package:flutter/material.dart';

class TaskWidget extends StatefulWidget {
  final String nameTask;

  const TaskWidget({super.key, required this.nameTask});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  int level = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 140,
            decoration: const BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
          Column(
            children: [
              Container(
                height: 100,
                decoration: const BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                    ),
                    Text(
                      widget.nameTask,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
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
                              )),
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
                        value: level / 10,
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

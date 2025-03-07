import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Add New Task", style: TextStyle(color: Colors.black)),
      ),
      body: Center(
        child: Container(
          width: 375,
          height: 650,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 3),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "Name:",
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  controller: imageController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "image:",
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: urlController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: "difficulty:",
                    hintStyle: TextStyle(color: Colors.black),
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                    focusedBorder:
                        OutlineInputBorder(borderSide: BorderSide(color: Colors.black, width: 2)),
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 2),
                ),
              ),
              SizedBox(
                width: 200,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
                  child: const Text("Add", style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

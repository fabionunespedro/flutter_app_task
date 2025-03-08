import 'package:flutter/material.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text("Add New Task", style: TextStyle(color: Colors.black)),
        ),
        body: Center(
          child: SingleChildScrollView(
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
                      validator: (String? value) {
                        if (value != null && value.isEmpty) {
                          return "enter task name";
                        }
                        return null;
                      },
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      cursorErrorColor: Colors.black,
                      decoration: const InputDecoration(
                          hintText: "Name:",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "insert an image URL";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {});
                      },
                      keyboardType: TextInputType.url,
                      controller: imageController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      cursorErrorColor: Colors.black,
                      decoration: const InputDecoration(
                          hintText: "image:",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty || int.parse(value) > 5 || int.parse(value) < 1) {
                          return "enter a number between 1 and 5";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      controller: difficultyController,
                      style: const TextStyle(color: Colors.black),
                      cursorColor: Colors.black,
                      cursorErrorColor: Colors.black,
                      decoration: const InputDecoration(
                          hintText: "difficulty:",
                          hintStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black, width: 2))),
                    ),
                  ),
                  Container(
                    width: 80,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 2),
                    ),
                    child: Image.network(
                      imageController.text,
                      errorBuilder:
                          (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return Image.asset("assets/img/error.png");
                      },
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(content: Text("Saving new task")));
                          Navigator.pop(context);
                        }
                      },
                      style:
                          const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black)),
                      child: const Text("Add", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

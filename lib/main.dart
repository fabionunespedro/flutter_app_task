import 'package:flutter/material.dart';
import 'package:flutter_app_task/screens/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: const HomePage(),
      theme: ThemeData(primaryColor: Colors.amber),
    ),
  );
}

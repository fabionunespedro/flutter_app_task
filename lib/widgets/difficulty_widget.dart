import 'package:flutter/material.dart';

class DifficultyWidget extends StatefulWidget {
  const DifficultyWidget({super.key, required this.difficultyColors});

  final int difficultyColors;

  @override
  State<DifficultyWidget> createState() => _DifficultyWidgetState();
}

class _DifficultyWidgetState extends State<DifficultyWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 18, color: (widget.difficultyColors >= 1) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (widget.difficultyColors >= 2) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (widget.difficultyColors >= 3) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (widget.difficultyColors >= 4) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (widget.difficultyColors >= 5) ? Colors.amber : Colors.amber[100]),
      ],
    );
  }
}

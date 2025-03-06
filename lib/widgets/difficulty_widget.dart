import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  const DifficultyWidget({super.key, required this.difficultyColors});

  final int difficultyColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,
            size: 18, color: (difficultyColors >= 1) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (difficultyColors >= 2) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (difficultyColors >= 3) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (difficultyColors >= 4) ? Colors.amber : Colors.amber[100]),
        Icon(Icons.star,
            size: 18, color: (difficultyColors >= 5) ? Colors.amber : Colors.amber[100]),
      ],
    );
  }
}

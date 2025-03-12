class TaskModel {
  final String name;
  final String image;
  final int difficulty;

  TaskModel({
    required this.name,
    required this.image,
    required this.difficulty,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'difficulty': difficulty,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      name: map['name'],
      image: map['image'],
      difficulty: map['difficulty'],
    );
  }
}

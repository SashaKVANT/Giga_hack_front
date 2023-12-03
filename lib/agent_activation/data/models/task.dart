class Task {
  final String input;

  Task({required this.input});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      input: json['input'] ?? '',
    );
  }
}

class Task {
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  Task(
      {this.id = '',
      this.isDone = false,
      required this.title,
      required this.date,
      required this.description});
  Task.fromJson(Map<String, dynamic> json)
      : this(
          title: json['title'] as String,
          description: json['description'] as String,
          date: json['date'] as int,
          isDone: json['isDone'] as bool,
          id: json['id'] as String,
        );
  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'date': date,
        'isDone': isDone,
        'id': id,
      };
}

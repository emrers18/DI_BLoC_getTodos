class Todo{

  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  const Todo({
     this.userId,
     this.id,
     this.title,
     this.completed
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        completed: json['completed'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };

}
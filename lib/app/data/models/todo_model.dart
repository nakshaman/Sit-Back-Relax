class TodoModel {
  final String id;
  final bool marked;
  final String name;
  final String description;
  final DateTime? dueDateTime;
  final DateTime createdOn;

  TodoModel({
    required this.id,
    required this.marked,
    required this.name,
    required this.description,
    required this.dueDateTime,
    required this.createdOn,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['_id'],
      marked: json['marked'] ?? false,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      dueDateTime: json['dueDateTime'] != null
          ? DateTime.parse(json['dueDateTime'])
          : null,
      createdOn: DateTime.parse(json['createdOn']),
    );
  }
  TodoModel copyWith({bool? marked}) {
    return TodoModel(
      id: id,
      marked: marked ?? this.marked,
      name: name,
      description: description,
      dueDateTime: dueDateTime,
      createdOn: createdOn,
    );
  }
}

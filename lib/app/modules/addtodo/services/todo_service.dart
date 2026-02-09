import 'package:appknit/app/data/secrets.dart';
import 'package:get/get.dart';

class TodoService extends GetConnect {
  Future<Response> addTodo({
    required String token,
    required String name,
    required String description,
    required DateTime dueDateTime,
  }) {
    return post(
      '$apiUrl/toDo/add',
      {
        "name": name,
        "description": description,
        "dueDateTime": dueDateTime.toIso8601String(),
      },
      headers: {
        "Authorization": token,
        "Content-Type": "application/json",
      },
    );
  }
}

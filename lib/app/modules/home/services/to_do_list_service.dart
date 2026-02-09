import 'package:appknit/app/data/secrets.dart';
import 'package:get/get.dart';
import 'package:appknit/app/data/services/auth_service.dart';

class ToDoListService extends GetConnect {
  final AuthService _authService = Get.find<AuthService>();
  Future<Response> fetchTodoList() {
    return post(
      '$apiUrl/toDo/list',
      {},
      headers: {
        'Authorization': _authService.accessToken!,
        'Content-Type': 'application/json',
      },
    );
  }

  Future<Response> deleteTodo({
    required String toDoId,
  }) {
    return post(
      '$apiUrl/toDo/delete',
      {
        "todoRef": toDoId,
      },
      headers: {
        'Authorization': _authService.accessToken!,
        'Content-Type': 'application/json',
      },
    );
  }
}

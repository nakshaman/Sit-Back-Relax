import 'package:appknit/app/data/models/todo_model.dart';
import 'package:appknit/app/modules/home/services/to_do_list_service.dart';
import 'package:appknit/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final ToDoListService _toDoListService = Get.find<ToDoListService>();
  RxBool isLoading = false.obs;
  RxList<TodoModel> toDoList = <TodoModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      isLoading.value = true;
      final response = await _toDoListService.fetchTodoList();
      if (response.isOk && response.body != null) {
        final List dataList = response.body['data'];
        toDoList.value = dataList.map((e) => TodoModel.fromJson(e)).toList();
      } else {
        Get.snackbar('No data', 'Failed to fetch to do list');
      }
    } catch (e) {
      Get.snackbar('Network error', 'Your network is not working');
    } finally {
      isLoading.value = false;
    }
  }

  void toggleComplete(TodoModel toDo) {
    final index = toDoList.indexWhere((e) => e.id == toDo.id);
    if (index == -1) return;

    toDoList[index] = toDo.copyWith(marked: !toDo.marked);
  }

  void addToDo() {
    Get.toNamed(Routes.ADDTODO);
  }

  Future<bool> deleteToDo(TodoModel toDo) async {
    try {
      final response = await _toDoListService.deleteTodo(toDoId: toDo.id);
      if (response.isOk) {
        toDoList.removeWhere((e) => e.id == toDo.id);
        Get.snackbar(
          'Deleted',
          'Todo deleted successfully',
          backgroundColor: Colors.white,
          colorText: Colors.black,
          snackPosition: SnackPosition.TOP,
          margin: const EdgeInsets.all(16),
          borderRadius: 12,
        );
        return true;
      } else {
        Get.snackbar('Error', 'Failed to delete Todo');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'Network Error');
      return false;
    }
  }
}

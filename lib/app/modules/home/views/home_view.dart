import 'package:appknit/app/modules/home/views/delete_confirm_sheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../views/to_do_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'To Do List',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Get.toNamed('/addtodo');
              controller.fetchTodos();
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1,
              ),
            );
          }

          if (controller.toDoList.isEmpty) {
            return const Center(
              child: Text(
                'No Todos Found',
                style: TextStyle(color: Colors.white54),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: controller.toDoList.length,
            itemBuilder: (_, index) {
              final todo = controller.toDoList[index];

              return Dismissible(
                key: ValueKey(todo.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 24),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                confirmDismiss: (_) async {
                  final shouldDelete = await showDeleteConfirmSheet();
                  if (shouldDelete == true) {
                    return await controller.deleteToDo(todo);
                  }
                  return false;
                },
                child: ToDoCard(
                  toDo: todo,
                  onTap: () => controller.toggleComplete(todo),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

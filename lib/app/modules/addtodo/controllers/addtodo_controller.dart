import 'package:appknit/app/data/services/auth_service.dart';
import 'package:appknit/app/modules/addtodo/services/todo_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddtodoController extends GetxController {
  final TodoService _todoService = Get.find<TodoService>();
  RxBool isLoading = false.obs;
  final AuthService _authService = Get.find<AuthService>();
  String? get accessToken => _authService.accessToken;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  Future<void> pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) selectedDate.value = date;
  }

  Future<void> pickTime(BuildContext context) async {
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) selectedTime.value = time;
  }

  Future<void> submitTodo() async {
    if (titleController.text.trim().isEmpty && selectedDate.value == null ||
        selectedTime.value == null) {
      Get.snackbar(
        'Error',
        'Titile, Date, Time is required',
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
      return;
    }
    if (accessToken == null) {
      Get.snackbar(
        'Error',
        'Access token not found',
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
      return;
    }
    try {
      isLoading.value = true;
      final response = await _todoService.addTodo(
        token: accessToken!,
        name: titleController.text.trim(),
        description: descriptionController.text.trim(),
        dueDateTime: DateTime(
          selectedDate.value!.year,
          selectedDate.value!.month,
          selectedDate.value!.day,
          selectedTime.value!.hour,
          selectedTime.value!.minute,
        ),
      );
      if (response.isOk) {
        Get.snackbar(
          'Success',
          'Todo added Successfully',
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
      } else {
        Get.snackbar(
          'Error',
          response.body['message'] ?? 'Something went wrong',
          backgroundColor: Colors.white,
          colorText: Colors.black,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Network error',
        backgroundColor: Colors.white,
        colorText: Colors.black,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

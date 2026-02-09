import 'package:appknit/app/modules/addtodo/services/todo_service.dart';
import 'package:get/get.dart';
import '../controllers/addtodo_controller.dart';

class AddtodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoService>(() => TodoService());
    Get.lazyPut<AddtodoController>(
      () => AddtodoController(),
    );
  }
}

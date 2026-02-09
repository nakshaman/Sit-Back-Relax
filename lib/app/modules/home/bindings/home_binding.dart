import 'package:appknit/app/modules/home/services/to_do_list_service.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ToDoListService>(() => ToDoListService());
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}

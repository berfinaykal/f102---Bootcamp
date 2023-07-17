import 'package:get/get.dart';
import 'package:GetSetGo_Holiday/app/data/provider/task/provider.dart';
import 'package:GetSetGo_Holiday/app/data/services/storage/repository.dart';
import 'package:GetSetGo_Holiday/app/modules/home/controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeController(
        taskRepository: TaskRepository(
          taskProvider: TaskProvider(),
        ),
      ),
    );
  }
}

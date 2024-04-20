import 'package:get/get.dart';
import 'package:task_management_flutter/task/model/TaskModel.dart';
import 'package:task_management_flutter/task/ui/Task.dart';

class TaskController extends GetxController {
  static TaskController to = Get.find();

  Task buildTask(){
    return Task();
  }

}

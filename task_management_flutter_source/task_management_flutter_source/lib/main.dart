import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_flutter/login/controller/login_controller.dart';
import 'package:task_management_flutter/routes/app_router.dart';
import 'package:task_management_flutter/task/controller/TaskController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    Get.put(TaskController());
    return GetMaterialApp(
      key: GlobalKey(),
      debugShowCheckedModeBanner: false,
      title: 'Endpoint Builder',
      onGenerateRoute: AppRouter().getRoutes,
      initialRoute: "/",
    );
  }
}

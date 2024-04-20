import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_management_flutter/login/controller/login_controller.dart';
import 'package:task_management_flutter/task/controller/TaskController.dart';

class AppRouter {
  List<GetPage> get routes => <GetPage<dynamic>>[
        GetPage<dynamic>(
          name: '/taskboard',
          page: () => TaskController.to.buildTask(),
        ),
      ];

  Route<dynamic>? getRoutes(RouteSettings settings) {
    return GetPageRoute<GetPageBuilder>(
      settings: settings,
      page: _getPage(settings.name),
    );
  }

  GetPageBuilder _getPage(String? name) {
    final GetPage<dynamic> route = routes.firstWhere(
      (GetPage<dynamic> route) => route.name == name,
      orElse: () => GetPage<dynamic>(
        name: '/',
        page: () => LoginController.to.buildLogin(),
      ),
    );
    return route.page;
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_management_flutter/task/content/CreateTask.dart';
import 'package:task_management_flutter/task/content/ManageTask.dart';
import 'package:task_management_flutter/task/controller/TaskController.dart';
import 'package:task_management_flutter/task/model/TaskModel.dart';
import 'package:task_management_flutter/util/Assets.dart';

class Task extends StatelessWidget {
  final TaskController taskController = Get.put(TaskController());
  RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    TaskModel model = TaskModel();
    model.title = 'Java';
    model.description = 'Java king kong';
    model.status = 'ToDo';
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    model.listModel.add(model);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'A Simple Task Management',
          style: GoogleFonts.nabla(),
        ),
        backgroundColor: Colors.blue.shade900,
        centerTitle: true,
        shadowColor: Colors.black,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            alignment: Alignment.center,
            constraints: constraints,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.starryNightSky),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
              ),
            ),
            child: Obx(
              () => Row(
                children: [
                  NavigationRail(
                    selectedIndex: currentIndex.value,
                    onDestinationSelected: (int index) {
                      currentIndex.value = index;
                    },
                    labelType: NavigationRailLabelType.all,
                    minWidth: 150,
                    groupAlignment: -0.9,
                    leading: const CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage(Assets.flutterCanonical),
                      ),
                    ),
                    backgroundColor: Colors.blue.shade900,
                    destinations: const <NavigationRailDestination>[
                      NavigationRailDestination(
                        icon: Icon(Icons.create),
                        selectedIcon: Icon(Icons.create),
                        label: Text('Create Task'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.manage_history),
                        selectedIcon: Icon(Icons.manage_history),
                        label: Text('Manage Task'),
                      ),
                    ],
                    selectedIconTheme: const IconThemeData(color: Colors.black),
                    unselectedIconTheme:
                        const IconThemeData(color: Colors.white38),
                    selectedLabelTextStyle:
                        const TextStyle(color: Colors.white),
                    unselectedLabelTextStyle:
                        const TextStyle(color: Colors.white38),
                  ),
                  // const VerticalDivider(thickness: 120, width: 120),
                  Expanded(
                    child: Center(
                      child: IndexedStack(
                        index: currentIndex.value,
                        children: [
                          CreateTask(
                            model: model,
                          ),
                          ManageTask(
                            model: model,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

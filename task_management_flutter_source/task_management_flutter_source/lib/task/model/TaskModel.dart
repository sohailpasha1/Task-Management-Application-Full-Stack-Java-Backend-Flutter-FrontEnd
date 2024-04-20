

class TaskModel {
  late String title ;
  late String description;
  late String status;
  late List<TaskModel> listModel;

  TaskModel() {
    listModel = List.empty(growable: true);
    title = '';
    description = '';
    status = 'ToDo';
  }
}

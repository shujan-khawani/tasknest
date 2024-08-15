import 'package:hive_flutter/hive_flutter.dart';

class TaskNestDataBase {
  //List of All Tasks
  List toDoList = [];

  //Tasks Completed
  int completedTasks = 0;
  //Tasks Completed
  int uncompletedTasks = 0;

  //Referencing the Box
  final _myBox = Hive.box('mybox');

  //Initial Tasks to Show when opened first time
  void createInitialData() {
    _myBox.clear();
    toDoList = [
      ['Welcome', true],
    ];
    completedTasks = 1;
    uncompletedTasks = 0;
  }

  //Read or Load the Data from DataBase
  void readData() {
    toDoList = _myBox.get('TODOLIST') ?? [];
    completedTasks = _myBox.get('CompletedTask') ?? 0;
    uncompletedTasks = _myBox.get('uncompletedTask') ?? 0;
  }

  //Update the Data from DataBase
  void updateData() {
    _myBox.put('TODOLIST', toDoList);
    _myBox.put('CompletedTask', completedTasks);
    _myBox.put('uncompletedTask', uncompletedTasks);
  }
}

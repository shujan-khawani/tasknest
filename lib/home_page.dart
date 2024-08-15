import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasknest/components/dialog_box.dart';
import 'package:tasknest/components/my_drawer.dart';
import 'package:tasknest/components/my_progress_indicator.dart';
import 'package:tasknest/components/my_text.dart';
import 'package:tasknest/components/to_do_tile.dart';
import 'package:tasknest/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Referencing hive box
  final _myBox = Hive.box('mybox');

  //Object of DataBase
  TaskNestDataBase dataBase = TaskNestDataBase();

  @override
  void initState() {
    //First Time Opening App? Get Initial Data
    if (_myBox.get('TODOLIST') == null) {
      dataBase.createInitialData();
    } //Else Get Already Stored Data
    else {
      dataBase.readData();
    }
    super.initState();
  }

  //Checkbox Changer Function
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      dataBase.toDoList[index][1] = !dataBase.toDoList[index][1];

      // Update task counts
      if (dataBase.toDoList[index][1]) {
        dataBase.completedTasks++;
        dataBase.uncompletedTasks--;
      } else {
        dataBase.completedTasks--;
        dataBase.uncompletedTasks++;
      }

      // Ensure counts do not go negative
      dataBase.completedTasks =
          dataBase.completedTasks.clamp(0, dataBase.toDoList.length);
      dataBase.uncompletedTasks =
          dataBase.uncompletedTasks.clamp(0, dataBase.toDoList.length);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: const Duration(seconds: 1),
          content: Text(
              '${dataBase.toDoList[index][1] ? 'Well Done, Task Completed' : 'Task Not Completed Yet'}')));
      //Update Data in database
      dataBase.updateData();
    });
  }

  final _taskController = TextEditingController();

  //Task Creating Function
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _taskController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      dataBase.toDoList.add([_taskController.text, false]);
      _taskController.clear();
      dataBase.uncompletedTasks++;
      //Update Data in database
      dataBase.updateData();
    });
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        duration: Duration(seconds: 2), content: Text('New Task Added')));
  }

  void deleteTask(int index) {
    setState(() {
      if (dataBase.toDoList[index][1]) {
        dataBase.completedTasks--;
      } else {
        dataBase.uncompletedTasks--;
      }

      // Ensure counts do not go negative
      dataBase.completedTasks =
          dataBase.completedTasks.clamp(0, dataBase.toDoList.length - 1);
      dataBase.uncompletedTasks =
          dataBase.uncompletedTasks.clamp(0, dataBase.toDoList.length - 1);

      // Remove the task from the list
      dataBase.toDoList.removeAt(index);
      //Update Data in database
      dataBase.updateData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          'Task Nest',
          style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.normal),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(CupertinoIcons.plus_app),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.background,
                    ]),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Text(
                          'STATISTICS',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                MyText(
                                  giveText: 'Total Tasks',
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                MyText(
                                  giveText: '${dataBase.toDoList.length}',
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyText(
                                  giveText: 'Completed',
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                MyText(
                                  giveText: '${dataBase.completedTasks}',
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MyText(
                                  giveText: 'UnCompleted',
                                  fontSize: 20,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                                MyText(
                                  giveText: '${dataBase.uncompletedTasks}',
                                  fontSize: 15,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      MyProgressIndicator(
                        giveValue: dataBase.toDoList.isEmpty
                            ? 0.0
                            : (dataBase.completedTasks /
                                    dataBase.toDoList.length)
                                .clamp(0.0, 1.0),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'My Tasks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: dataBase.toDoList.length,
                      itemBuilder: (context, index) {
                        return ToDoTile(
                          taskName: dataBase.toDoList[index][0],
                          taskCompleted: dataBase.toDoList[index][1],
                          onChanged: (value) => checkBoxChanged(value, index),
                          deleteFunction: (context) => deleteTask(index),
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';
import 'package:todo/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  reference the box
  final _mybox = Hive.box('mybox');
  //  get db data
  ToDoDatabase db = ToDoDatabase();

  //  first time opening the application
  @override
  void initState() {
    // first time opening the app
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      //  load data
      db.loadData();
    }
  }

  //  text controller for the work
  final _controller = TextEditingController();

  // checkbox change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  // save the task given
  void saveTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateDataBase();
    Navigator.pop(context);
  }

  // create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveTask,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  //  delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[300],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'To DO',
          style: TextStyle(fontSize: 24.0),
        ),
        elevation: 0.0,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
    );
  }
}

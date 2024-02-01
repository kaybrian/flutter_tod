import 'package:flutter/material.dart';
import 'package:todo/components/dialog_box.dart';
import 'package:todo/components/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //  text controller for the work
  final _controller = TextEditingController();

  //  list of todo tasks
  List toDoList = [
    ["Buy milk", false],
    ["Buy eggs", false],
    ["Buy bread", false],
    ["Buy meat", false],
  ];

  // checkbox change
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // save the task given
  void saveTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('To DO'),
        elevation: 0.0,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) {
              checkBoxChanged(value, index);
            },
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

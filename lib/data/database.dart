import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  //  get the bos
  final _myBox = Hive.box('mybox');

  //  add a new task first time running the app
  void createInitialData() {
    toDoList = [
      ['Make Your first To-Do', false],
      ['Tap on the + button to add a new task', false],
      ['Swipe left to delete a task', false],
      ['Tap on the checkbox to mark a task as completed', false],
    ];
  }

  // load sata from db
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  //   update the db
  void updateDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}

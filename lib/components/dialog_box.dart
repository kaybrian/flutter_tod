import 'package:flutter/material.dart';
import 'package:todo/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
          height: 200.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                autofocus: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(1.0)),
                  ),
                  hintText: 'Add a new task',
                  focusColor: Color.fromARGB(255, 85, 84, 84),
                ),
              ),

              // add the buttons -> save and cancel
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    text: 'Save',
                    onTap: onSave,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  MyButton(
                    text: 'Cancel',
                    onTap: onCancel,
                  ),
                ],
              )
            ],
          )),
    );
  }
}

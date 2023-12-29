import 'package:flutter/material.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/todo_item.dart';

class ListToDo extends StatelessWidget {
  final void Function(ToDo) onToDoChange;
  final void Function(String) onDeleteItem;
  final List<ToDo> foundToDo;

  const ListToDo(
      {Key? key,
      required this.onToDoChange,
      required this.onDeleteItem,
      required this.foundToDo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 20),
                child: const Text(
                  'All ToDos',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          for (ToDo toDo in foundToDo.reversed)
            ToDoItem(
              toDo: toDo,
              onToDoChange: onToDoChange,
              onDeleteItem: onDeleteItem,
            ),
        ],
      ),
    );
  }
}

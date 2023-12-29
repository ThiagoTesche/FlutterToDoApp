import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';

class AddToDoItem extends StatelessWidget {
  final TextEditingController toDoController;
  final void Function(String) addToDoItem;

  const AddToDoItem(
      {Key? key, required this.toDoController, required this.addToDoItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 10.0,
                    spreadRadius: 0,
                  )
                ],
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: toDoController,
                decoration: InputDecoration(
                    hintText: 'Add a new  toDo item',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20, right: 20),
            child: IconButton(
              icon: Icon(Icons.add),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll<Color>(tdBlue)),
              color: Colors.white,
              onPressed: () {
                addToDoItem(toDoController.text);
              },
            ),
          ),
        ],
      ),
    );
  }
}

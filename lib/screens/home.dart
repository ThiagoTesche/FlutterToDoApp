import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';
import 'package:todo_list/model/todo.dart';
import 'package:todo_list/widgets/app_bar.dart';
import 'package:todo_list/widgets/search_box.dart';
import 'package:todo_list/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final toDosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _toDoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = toDosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBgColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            margin: EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                SearchBox(
                  onToDoChange: _handleSearch,
                ),
                Expanded(
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
                      for (ToDo toDo in _foundToDo.reversed)
                        ToDoItem(
                          toDo: toDo,
                          onToDoChange: _handleToDoChange,
                          onDeleteItem: _handleDeleteToDoItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
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
                        controller: _toDoController,
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
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(tdBlue)),
                        color: Colors.white,
                        onPressed: () {
                          _addToDoItem(_toDoController.text);
                        },
                      )),
                ],
              )),
        ],
      ),
    );
  }

  void _handleSearch(String query) {
    List<ToDo> results = [];

    if (query.isEmpty) {
      results = toDosList;
    } else {
      results = toDosList
          .where((item) =>
              item.todoText!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundToDo = results;
    });
  }

  void _addToDoItem(String itemText) {
    if (itemText.isEmpty) {
      _showToast('Campo obrigatório');
      return;
    }

    setState(() {
      toDosList.add(
        ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: itemText),
      );
    });
    _toDoController.clear();
  }

  void _handleToDoChange(ToDo toDo) {
    setState(() {
      toDo.isDone = !toDo.isDone;

      if (toDo.isDone) {
        _showToast('Item marcado com sucesso!');
      } else {
        _showToast('Item desmarcado com sucesso!');
      }
    });
  }

  void _handleDeleteToDoItem(String id) {
    setState(() {
      toDosList.removeWhere((item) => item.id == id);

      _showToast('Item deletado com sucesso!');
    });
  }

  void _showToast(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      showCloseIcon: true,
      backgroundColor: Colors.green,
      duration: Duration(milliseconds: 800),
    ));
  }
}

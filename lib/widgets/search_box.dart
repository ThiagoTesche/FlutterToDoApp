import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';

class SearchBox extends StatelessWidget {
  final void Function(String) onToDoChange;

  const SearchBox({
    Key? key,
    required this.onToDoChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      height: 45,
      child: TextField(
        onChanged: (value) => onToDoChange(value),
        style: TextStyle(fontSize: 14),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: Colors.black, size: 20),
          prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdGrey),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:todo_list/constants/colors.dart';

class buildAppBar extends StatelessWidget implements PreferredSizeWidget {
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: tdBgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              maxRadius: 18,
              child: Icon(Icons.person),
            ),
          )
        ]);
  }
}

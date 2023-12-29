import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ListTile(
          leading: const Icon(Icons.accessibility_new),
          title: const Text('Welcome'),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        ListTile(
          dense: true,
          leading: const Icon(Icons.settings),
          title: const Text('Settings'),
          onTap: () {
            Navigator.of(context).pop();
          },
        )
      ],
    ));
  }
}

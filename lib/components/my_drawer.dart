import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Icon(
              Icons.message,
              size: 100,
              color: Theme.of(context).colorScheme.primary,
            ),
          ), //TODO: Change icon here

          //home list tile
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: ListTile(
              title: Text(
                "HOME",
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              leading: Icon(Icons.home_filled,
                  size: 40, color: Theme.of(context).colorScheme.primary),
            ),
          )
          //settings tile

          //logout tile
        ],
      ),
    );
  }
}

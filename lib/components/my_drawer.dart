import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../pages/settings_page.dart';
import '../services/authentication/auth_service.dart';

void logout() {
  final _auth = AuthService();
  _auth.signOut();
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey.shade300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //logo
          Column(
            children: [
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
                    "H O M E",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  leading: Icon(Icons.home_filled,
                      size: 30, color: Theme.of(context).colorScheme.primary),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ListTile(
                  title: Text(
                    "S E T T I N G S",
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  leading: Icon(Icons.settings,
                      size: 30, color: Theme.of(context).colorScheme.primary),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Settings()));
                  },
                ),
              ),

/*
              logout tile
*/
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 30),
            child: NeumorphicButton(
              child: Text(
                "L O G O U T",
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              onPressed: logout,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:chat_app/authentication/auth_service.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NeumorphicAppBar(
          key: key,
          title: Text('Home'),
          actions: [
            IconButton(onPressed: logout, icon: Icon(Icons.logout_sharp))
          ],
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}

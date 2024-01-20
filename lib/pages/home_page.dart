import 'package:chat_app/components/my_appbar.dart';
import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/authentication/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
/*
import 'package:neumorphic_ui/neumorphic_ui.dart';
*/

import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color(0xffcbd8ca),
      drawer: MyDrawer(),
      appBar: MyAppBar(
        onMenuPressed: () {
          _scaffoldKey.currentState?.openDrawer();
        },
        title: 'H O M E',
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: _buildUserList(),
      ),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
        stream: _chatService.getUsersStream(),
        builder: (context, snapshot) {
          // error
          if (snapshot.hasError) {
            return const Text("Error");
          }
          //Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          return ListView(
            children: snapshot.data!
                .map<Widget>(
                    (userData) => _buildUserListItem(userData, context))
                .toList(),
          );
        });
  }

  //Build individual listtile  for user

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //Display all users except current user

    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["name"],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData['email'],
                receiverID: userData['uid'],
                receivername: userData['name'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}

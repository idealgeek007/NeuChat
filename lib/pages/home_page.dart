import 'package:chat_app/components/my_drawer.dart';
import 'package:chat_app/services/authentication/auth_service.dart';
import 'package:chat_app/services/chat/chat_service.dart';
import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat and auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        drawer: MyDrawer(),
        appBar: AppBar(
          title: const Text('Home'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
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
            return const Text("LLoading...");
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
    return UserTile(
      text: userData["email"],
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
            ),
          ),
        );
      },
    );
  }
}

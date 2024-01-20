import 'dart:developer';

import 'package:chat_app/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';
import 'package:random_avatar/random_avatar.dart';

final TextEditingController _controller = TextEditingController();
final List<Widget> _painters = <Widget>[];

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  UserTile({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      child: NeumorphicButton(
        onPressed: onTap,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        style: NeumorphicStyle(
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          children: [
            Container(
              child: RandomAvatar('$text', height: 50, width: 50),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: ktextstyle,
            ),
          ],
        ),
      ),
    );
  }
}

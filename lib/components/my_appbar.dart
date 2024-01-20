// my_app_bar.dart

import 'package:flutter/material.dart';
import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function() onMenuPressed;
  final String title;
  const MyAppBar({
    Key? key,
    required this.onMenuPressed,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      foregroundColor: Colors.green,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: NeumorphicText(
        title,
        style: NeumorphicStyle(
            depth: 3,
            color: Color(0xff97c272),
            lightSource: LightSource.bottomRight),
        textStyle: NeumorphicTextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w900,
        ),
      ),
      leading: NeumorphicButton(
        style: NeumorphicStyle(
          lightSource: LightSource.top,
          color: Theme.of(context).colorScheme.background,
        ),
        child: Icon(Icons.menu),
        onPressed: onMenuPressed,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      ),
    );
  }
}

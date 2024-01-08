import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  MyButton({super.key, required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 430,
        height: 60,
        child: NeumorphicButton(
          onPressed: onTap,
          style: NeumorphicStyle(
              color: Theme.of(context).colorScheme.secondary,
              boxShape:
                  NeumorphicBoxShape.roundRect(BorderRadius.circular(12))),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

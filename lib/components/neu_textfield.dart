import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class NeuTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final bool selection;

  final TextEditingController controller;

  NeuTextField(
      {required this.hint,
      required this.obscure,
      required this.controller,
      required this.selection});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 70,
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        child: TextField(
          enableInteractiveSelection: selection, // Disables text selection

          obscureText: obscure,
          controller: controller,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ),
    );
  }
}

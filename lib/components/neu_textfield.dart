import 'package:gusto_neumorphic/gusto_neumorphic.dart';

class NeuTextField extends StatelessWidget {
  final String hint;
  final bool obscure;
  final bool selection;
  final FocusNode? focusNode;

  final TextEditingController controller;

  NeuTextField(
      {super.key,
      required this.hint,
      required this.obscure,
      required this.controller,
      required this.selection,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 430,
      height: 70,
      child: Neumorphic(
        style: NeumorphicStyle(
          lightSource: LightSource.topLeft,
          intensity: 5,
          color: Theme.of(context).colorScheme.primary,
          depth: NeumorphicTheme.embossDepth(context),
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(15)),
        ),
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 18),
        child: TextField(
          enableInteractiveSelection: selection, // Disables text selection

          obscureText: obscure,
          controller: controller,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: hint,
          ),
        ),
      ),
    );
  }
}

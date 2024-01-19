import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class NeuNavBar extends StatefulWidget {
  const NeuNavBar({super.key});

  @override
  State<NeuNavBar> createState() => _NeuNavBarState();
}

class _NeuNavBarState extends State<NeuNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [],
    );
  }
}

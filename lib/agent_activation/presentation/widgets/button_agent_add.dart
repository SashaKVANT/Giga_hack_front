import 'package:flutter/material.dart';

class ButtonAgentAdd extends StatelessWidget {
  final VoidCallback onIncrement;
  const ButtonAgentAdd({super.key, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onIncrement,
      child: Icon(Icons.add),
    );
  }
}

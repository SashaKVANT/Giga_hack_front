import 'package:flutter/material.dart';

class ButtonAgentDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          print('Удален агент');
        },
        child: Icon(
          Icons.delete_rounded,
          color: Color.fromARGB(179, 3, 3, 3),
        ),
      ),
    );
  }
}

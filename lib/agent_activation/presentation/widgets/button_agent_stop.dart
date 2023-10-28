import 'package:flutter/material.dart';

class ButtonAgentStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          print('Агент остановлен');
        },
        child: Text('Остановить'),
      ),
    );
  }
}

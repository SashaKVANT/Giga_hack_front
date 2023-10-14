import 'package:flutter/material.dart';

class RowAboveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 20,
        ),
        _expandedText(),
        _roundedButton()
      ],
    );
  }
}

Widget _expandedText() {
  return Expanded(
    child: Text(
      'Мои запросы',
      textScaleFactor: 2.0,
      style: TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      // overflow: TextOverflow.ellipsis,
    ),
  );
}

Widget _roundedButton() {
  return ElevatedButton(
    onPressed: () {
      print("icon pressed");
    },
    child: Icon(
      Icons.menu_rounded,
      color: Color.fromARGB(179, 4, 230, 211),
    ),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

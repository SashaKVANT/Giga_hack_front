import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RowAboveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 20,
        ),
        _myRequestsText(context),
        _roundedButton()
      ],
    );
  }
}

Widget _myRequestsText(BuildContext context) {
  return Expanded(
    child: Text(
      AppLocalizations.of(context).textAboveAgentCards,
      style: Theme.of(context).textTheme.headlineLarge,
      textScaleFactor: 1.0,
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
    ),
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}

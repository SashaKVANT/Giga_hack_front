import 'dart:math';
import 'package:flutter/material.dart';

class AuthPageLayout extends StatelessWidget {
  final Widget leftContent;
  final String imagePath;

  const AuthPageLayout({
    Key? key,
    required this.leftContent,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double minHeight = 400;
    double containerHeight = max(screenHeight, minHeight);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: containerHeight),
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Form content (like SignInForm) occupying the left 2/3 of the screen
                Expanded(
                  flex: 2,
                  child: leftContent,
                ),
                // Image occupying the right 1/3 of the screen
                Expanded(
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

import 'package:autogpt_frontend/auth/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double minHeight = 400; // Set this to your desired minimum height

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
                // SignInForm occupying the left 2/3 of the screen
                const Expanded(
                  flex: 2,
                  child: SignInForm(),
                ),

                // Image occupying the right 1/3 of the screen
                Expanded(
                  child: Image.asset('../../../../assets/auth.png',
                      fit: BoxFit.cover),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

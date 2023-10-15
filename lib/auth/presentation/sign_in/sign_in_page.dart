import 'package:flutter/material.dart';

import 'package:autogpt_frontend/auth/presentation/sign_in/widgets/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          // Image positioned to the right, full height
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Image.asset('../../../../assets/auth.png', fit: BoxFit.cover, height: double.infinity),
          ),

          // SignInForm occupying the left 2/3 of the screen
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: MediaQuery.of(context).size.width * (2 / 3),
            child: const SignInForm(),
          ),
        ],
      ),
    );
  }
}

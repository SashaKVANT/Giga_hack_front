import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Wrap(
        //crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        spacing: 20, // to apply margin in the main axis of the wrap
        runSpacing: 20, // to apply margin in the cross axis of the wrap
        children: [
          _welcomeText(),
          _emailField(),
          _passwordField(),
          _loginButton()
        ],
      ),
    );
  }
}

Widget _welcomeText() {
  return const Text("Рады видеть вас снова!");
}

// class WelcomeText extends StatelessWidget {
//   const WelcomeText({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Container(
//       child: Text(),
//     );
//   }
// }

Widget _passwordField() {
  return const SizedBox(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Пароль',
        ),
      ),
    );
}

Widget _emailField() {
  return const SizedBox(
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'E-mail',
        ),
      ),
    );
}

Widget _loginButton() {
  return ElevatedButton( 
  onPressed: () {}, 
  child: const Text('Вход')
  );
}

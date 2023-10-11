import 'package:flutter/material.dart';

class SignInForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              WelcomeTextWidget(),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeTextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Text(
      "Рады видеть вас снова!",
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class LoginFormWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _emailField(),
          _passwordField(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _passwordField() {
    return const TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0), // Adjust the radius as needed
          ),
        ),
        labelText: 'Пароль',
      ),
    );
  }

  Widget _emailField() {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0), // Adjust the radius as needed
          ),
        ),
        labelText: 'E-mail',
      ),
    );
  }

  Widget _loginButton() {
    return MaterialButton(onPressed: () {}, child: const Text('Вход'));
  }
}

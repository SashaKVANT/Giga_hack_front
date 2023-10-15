import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      //alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
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
  const WelcomeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context).gladToSeeYouAgain,
      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  // Widget build(BuildContext context) {
  //   return SizedBox(
  //     height: 200,
  //     width: 400,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center, // center the content
  //       children: [
  //         Flexible(child: _emailField()),      // wrap with Flexible
  //         SizedBox(height: 20),                // space between widgets
  //         Flexible(child: _passwordField()),  // wrap with Flexible
  //         SizedBox(height: 20),                // space between widgets
  //         _loginButton(),
  //       ],
  //     ),
  //   );
  // }
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _emailField(context),
          _passwordField(context),
          _loginButton(context),
        ],
      ),
    );
  }

  Widget _passwordField(context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0), // Adjust the radius as needed
          ),
        ),
        labelText: AppLocalizations.of(context).password,
      ),
    );
  }

  Widget _emailField(context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0), // Adjust the radius as needed
          ),
        ),
        labelText: AppLocalizations.of(context).email,
      ),
    );
  }

  Widget _loginButton(context) {
    return MaterialButton(onPressed: () {}, child: Text(AppLocalizations.of(context).signIn));
  }
}

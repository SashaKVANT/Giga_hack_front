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
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _welcomeText(BuildContext context) {
  return Text(
    AppLocalizations.of(context).gladToSeeYouAgain,
    style: Theme.of(context).textTheme.headlineLarge
  );
}

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _welcomeText(context),
          _emailField(context),
          _passwordField(context),
          _loginButton(context)
        ],
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: AppLocalizations.of(context).password,
        helperText: AppLocalizations.of(context).forgotPasswordRestore
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: AppLocalizations.of(context).email,
        helperText: AppLocalizations.of(context).enterEmailAddress
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return FilledButton(
      onPressed: () {},
      child: Text(AppLocalizations.of(context).signIn),
    );
  }
}

import 'package:autogpt_frontend/auth/bloc/login_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthForm extends StatelessWidget {
  final String welcomeText;

  final String primaryFieldHint;
  final String? primaryFieldHelper;
  final String? primaryFieldActionText;
  final bool isPrimaryFieldObscured;

  final String? secondaryFieldHint;
  final String? secondaryFieldHelper;
  final String? secondaryFieldActionText;
  final bool isSecondaryFieldObscured;

  final String? tertiaryFieldHint;
  final String? tertiaryFieldHelper;
  final String? tertiaryFieldActionText;
  final bool isTertiaryFieldObscured;

  final String buttonText;
  final String? buttonHelperText;
  final String? buttonActionText;

  const AuthForm({
    Key? key,
    required this.welcomeText,
    required this.primaryFieldHint,
    this.primaryFieldHelper,
    this.primaryFieldActionText,
    this.secondaryFieldHint,
    this.secondaryFieldHelper,
    this.secondaryFieldActionText,
    this.tertiaryFieldHint,
    this.tertiaryFieldHelper,
    this.tertiaryFieldActionText,
    required this.buttonText,
    this.buttonHelperText,
    this.buttonActionText,
    this.isPrimaryFieldObscured = false,
    this.isSecondaryFieldObscured = false,
    this.isTertiaryFieldObscured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: BlocProvider(
            create: (context) => LoginBloc(),
            child: _authFormWidget(context),
          ),
        ),
      ),
    );
  }

  Widget _welcome(BuildContext context) {
    return Text(welcomeText,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Theme.of(context).textTheme.headlineMedium);
  }

  Widget _authFormWidget(BuildContext context) {
    double formHeight;

    if (tertiaryFieldHint != null) {
      formHeight = 500; // increased height for 3 fields
    } else if (secondaryFieldHint != null) {
      formHeight = 450; // height for 2 fields
    } else {
      formHeight = 400; // default height for 1 field
    }

    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return SizedBox(
          height: formHeight,
          width: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _welcome(context),
              const SizedBox(height: 12.0),
              HelperActionTextField(
                  hintText: primaryFieldHint,
                  helperText: primaryFieldHelper,
                  actionText: primaryFieldActionText,
                  isObscured: isPrimaryFieldObscured,
                  onActionTap: () {},
                  func: (value) {
                    context.read<LoginBloc>().add(LoginEmailChanged(value));
                  }),
              if (secondaryFieldHint != null)
                HelperActionTextField(
                    hintText: secondaryFieldHint!,
                    helperText: secondaryFieldHelper,
                    actionText: secondaryFieldActionText,
                    onActionTap: () {},
                    isObscured: isSecondaryFieldObscured,
                    func: (value) {
                      context
                          .read<LoginBloc>()
                          .add(LoginPasswordChanged(value));
                    }),
              if (tertiaryFieldHint != null)
                HelperActionTextField(
                  hintText: tertiaryFieldHint!,
                  helperText: tertiaryFieldHelper,
                  actionText: tertiaryFieldActionText,
                  onActionTap: () {},
                  isObscured: isTertiaryFieldObscured,
                ),
              const SizedBox(height: 12.0),
              HelperActionFilledButton(
                buttonText: buttonText,
                helperText: buttonHelperText ?? '',
                actionText: buttonActionText ?? '',
                onButtonPressed: () {
                  Navigator.pushNamed(context, '/B');
                },
                onActionTap: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}

class HelperActionFilledButton extends StatelessWidget {
  final String buttonText;
  final String helperText;
  final String actionText;
  final VoidCallback onButtonPressed;
  final VoidCallback onActionTap;

  const HelperActionFilledButton({
    super.key,
    required this.buttonText,
    required this.helperText,
    required this.actionText,
    required this.onButtonPressed,
    required this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton(
          onPressed: onButtonPressed,
          child: Text(buttonText),
        ),
        const SizedBox(height: 8.0),
        AuthRichText(
          regularText: helperText,
          actionText: actionText,
          onActionTap: onActionTap,
        ),
      ],
    );
  }
}

class HelperActionTextField extends StatelessWidget {
  final String hintText;
  final String? helperText;
  final String? actionText;
  final VoidCallback? onActionTap;
  final bool isObscured;
  final void Function(String value)? func;

  const HelperActionTextField(
      {super.key,
      required this.hintText,
      this.helperText,
      this.actionText,
      this.onActionTap,
      this.isObscured = false,
      this.func});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          onChanged: (value) => func!(value),
          obscureText: isObscured,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            hintText: hintText,
          ),
        ),
        if (helperText != null || actionText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 12.0),
            child: AuthRichText(
              regularText: helperText ?? '',
              actionText: actionText ?? '',
              onActionTap: onActionTap,
            ),
          ),
      ],
    );
  }
}

class AuthRichText extends StatelessWidget {
  final String regularText;
  final String actionText;
  final VoidCallback? onActionTap;

  const AuthRichText({
    super.key,
    required this.regularText,
    required this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: Theme.of(context).textTheme.bodySmall,
        children: [
          TextSpan(text: regularText),
          TextSpan(
            text: actionText,
            style: TextStyle(color: Theme.of(context).colorScheme.secondary),
            recognizer: TapGestureRecognizer()..onTap = onActionTap,
          ),
        ],
      ),
    );
  }
}

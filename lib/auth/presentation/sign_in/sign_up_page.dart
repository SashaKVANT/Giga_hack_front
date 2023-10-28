import 'package:flutter/material.dart';
import 'package:autogpt_frontend/auth/presentation/sign_in/widgets/auth_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:autogpt_frontend/auth/presentation/sign_in/layouts/auth_page_layout.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      leftContent: AuthForm(
          welcomeText: AppLocalizations.of(context).hiLetsMeetCloser,
          primaryFieldHint: AppLocalizations.of(context).email,
          primaryFieldHelper: AppLocalizations.of(context).enterEmailAddress,
          secondaryFieldHint: AppLocalizations.of(context).password,
          secondaryFieldHelper:
              AppLocalizations.of(context).createAStrongPassword,
          tertiaryFieldHint: AppLocalizations.of(context).repeatNewPassword,
          tertiaryFieldHelper: AppLocalizations.of(context).passwordsMustMatch,
          buttonText: AppLocalizations.of(context).signUp,
          buttonHelperText: AppLocalizations.of(context).alreadyHaveAnAccount,
          buttonActionText: AppLocalizations.of(context).signIn),
      imagePath: '../../../../assets/auth.png',
    );
  }
}

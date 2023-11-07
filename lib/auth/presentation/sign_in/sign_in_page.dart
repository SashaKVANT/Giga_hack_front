import 'package:flutter/material.dart';
import 'package:autogpt_frontend/auth/presentation/sign_in/widgets/auth_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:autogpt_frontend/auth/presentation/sign_in/layouts/auth_page_layout.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      leftContent: AuthForm(
          welcomeText: AppLocalizations.of(context).gladToSeeYouAgain,
          primaryFieldHint: AppLocalizations.of(context).email,
          primaryFieldHelper: AppLocalizations.of(context).enterEmailAddress,
          secondaryFieldHint: AppLocalizations.of(context).password,
          secondaryFieldHelper: AppLocalizations.of(context).forgotPassword,
          secondaryFieldActionText: AppLocalizations.of(context).restore,
          isSecondaryFieldObscured: true,
          buttonText: AppLocalizations.of(context).signIn,
          buttonHelperText: AppLocalizations.of(context).dontHaveAnAccount,
          buttonActionText: AppLocalizations.of(context).signUp),
      imagePath: '../../../../assets/auth.png',
    );
  }
}

import 'package:flutter/material.dart';
import 'package:autogpt_frontend/auth/presentation/sign_in/widgets/auth_form.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:autogpt_frontend/auth/presentation/sign_in/layouts/auth_page_layout.dart';

class ForgotPassPage extends StatelessWidget {
  const ForgotPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthPageLayout(
      leftContent: AuthForm(
          welcomeText:
              AppLocalizations.of(context).itsOkIfYouForgotYourPassword,
          primaryFieldHint: AppLocalizations.of(context).newPassword,
          primaryFieldHelper:
              AppLocalizations.of(context).createAStrongPassword,
          secondaryFieldHint: AppLocalizations.of(context).repeatNewPassword,
          secondaryFieldHelper: AppLocalizations.of(context).passwordsMustMatch,
          buttonText: AppLocalizations.of(context).reset,
          buttonActionText: AppLocalizations.of(context).goBack),
      imagePath: '../../../../assets/auth.png',
    );
  }
}

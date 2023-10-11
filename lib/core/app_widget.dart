import "package:autogpt_frontend/auth/presentation/sign_in/sign_in_page.dart";
import "package:autogpt_frontend/core/theme/color_schema.dart";
import "package:flutter/material.dart";


class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme
      ),
      home: SignInPage(),
      );
  }
}

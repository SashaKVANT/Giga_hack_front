import "package:autogpt_frontend/agent_activation/presentation/agent_create_task.dart";
import "package:autogpt_frontend/agent_activation/presentation/agent_request_window.dart";
import "package:autogpt_frontend/auth/presentation/sign_in/forgot_pass_page.dart";
import "package:autogpt_frontend/agent_activation/presentation/agent_start_screen.dart";
import "package:autogpt_frontend/auth/presentation/sign_in/sign_in_page.dart";
import "package:autogpt_frontend/auth/presentation/sign_in/sign_up_page.dart";
import "package:autogpt_frontend/core/l10n/l10n.dart";
import "package:autogpt_frontend/core/theme/color_schema.dart";
import "package:autogpt_frontend/core/theme/text_theme.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.all,
        // locale: Locale('en', 'US'), # Для тестирования локалей
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
            textTheme: appTextTheme),
        initialRoute: '/A',
        routes: {
          '/B': (context) => SignInPage(),
          '/A': (context) => AgentStartScreen(),
          '/C': (context) => ForgotPassPage(),
          '/D': (context) => SignUpPage(),
          '/E': (context) => AgentRequestWindow(),
          '/F': (context) => AgentCreateTaskWindow()
          // '/C': (context) => ProfilePage(),
          // home: AgentStartScreen(),
        });
  }
}

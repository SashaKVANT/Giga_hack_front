import 'package:autogpt_frontend/agent_activation/presentation/agent_start_screen.dart';
import 'package:autogpt_frontend/agent_activation/presentation/screen_test.dart';
import "package:autogpt_frontend/core/l10n/l10n.dart";
import "package:autogpt_frontend/core/theme/color_schema.dart";
import "package:autogpt_frontend/core/theme/text_theme.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AgentStartApp());

class AgentStartApp extends StatelessWidget {
  const AgentStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: L10n.all,
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
          '/A': (context) => AgentStartScreen(),
          '/B': (context) => HomePage(),
          '/C': (context) => ProfilePage(),
          // home: AgentStartScreen(),
        });
  }
}

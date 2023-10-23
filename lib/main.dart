import 'package:autogpt_frontend/agent_activation/presentation/agent_start_screen.dart';
import 'package:autogpt_frontend/agent_activation/presentation/screen_test.dart';
import 'package:flutter/material.dart';

void main() => runApp(const AgentStartApp());

class AgentStartApp extends StatelessWidget {
  const AgentStartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorSchemeSeed: const Color.fromARGB(255, 0, 26, 255),
            useMaterial3: true),
        initialRoute: '/A',
        routes: {
          '/A': (context) => AgentStartScreen(),
          '/B': (context) => HomePage(),
          '/C': (context) => ProfilePage(),
          // home: AgentStartScreen(),
        });
  }
}

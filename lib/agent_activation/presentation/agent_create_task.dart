import 'package:autogpt_frontend/agent_activation/data/api/create_task.dart';
import 'package:autogpt_frontend/agent_activation/data/api/fetch_task.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_card.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_screen_add_agent.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/modal_widgets.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/text_button_above_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgentCreateTaskWindow extends StatefulWidget {
  @override
  _AgentCreateTaskWindowState createState() => _AgentCreateTaskWindowState();
}

class _AgentCreateTaskWindowState extends State<AgentCreateTaskWindow> {
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Create Task Request Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: inputController,
              decoration: InputDecoration(labelText: 'Enter your input'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final task_string = inputController.text;
                final input = await sendTask(task_string);
                outputController.text = input;
              },
              child: Text('Send API Request'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: outputController,
              decoration: InputDecoration(labelText: 'API Response'),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}

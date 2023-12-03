// import 'package:autogpt_frontend/agent_activation/presentation/screen_test.dart';
import 'package:autogpt_frontend/agent_activation/data/api/fetch_task.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_card.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_screen_add_agent.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/modal_widgets.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/text_button_above_card.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgentRequestWindow extends StatefulWidget {
  @override
  _AgentRequestWindowState createState() => _AgentRequestWindowState();
}

class _AgentRequestWindowState extends State<AgentRequestWindow> {
  TextEditingController taskIdController = TextEditingController();
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Request Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: taskIdController,
              decoration: InputDecoration(labelText: 'Enter Task ID'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: inputController,
              decoration: InputDecoration(labelText: 'Enter your input'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                final taskId = taskIdController.text;
                final input = await fetchQueryFromTask(taskId);
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

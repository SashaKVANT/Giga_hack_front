import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_add.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_delete.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_stop.dart';
import 'package:flutter/material.dart';

class WorkingAgentCard extends StatefulWidget {
  final String text;
  const WorkingAgentCard({super.key, required this.text});

  @override
  State<WorkingAgentCard> createState() => _WorkingAgentCardState();
}

class _WorkingAgentCardState extends State<WorkingAgentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: SizedBox(
        width: 300,
        child: Column(
          children: [
            AgentCardImage(),
            AgentCardListTile(title: widget.text),
            AgentCardSupportingText(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ButtonAgentStop(),
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonAgentDelete()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class AgentCardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: SizedBox(
        child: Ink.image(
          image: const NetworkImage(
              'https://source.unsplash.com/random/800x600?green'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class AgentCardListTile extends StatelessWidget {
  final String title;

  AgentCardListTile({required this.title});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text("subheading"),
      trailing: Icon(Icons.favorite_outline),
    );
  }
}

class AgentCardSupportingText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: const Text("supportingText"),
    );
  }
}

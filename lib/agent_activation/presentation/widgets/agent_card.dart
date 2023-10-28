import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_add.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_delete.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_stop.dart';
import 'package:flutter/material.dart';

class WorkingAgentCard extends StatefulWidget {
  final String text;
  final String image_url;
  final String subtitle;
  final String supporting;
  const WorkingAgentCard(
      {super.key,
      required this.text,
      required this.image_url,
      required this.subtitle,
      required this.supporting});

  @override
  State<WorkingAgentCard> createState() => _WorkingAgentCardState();
}

class _WorkingAgentCardState extends State<WorkingAgentCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      elevation: 4.0,
      child: ListView(
        shrinkWrap: true,
        children: [
          _agentCardImage(widget.image_url),
          _agentCardListTile(widget.text, widget.subtitle),
          _agentCardSupportingText(widget.supporting),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              // mainAxisSize: MainAxisSize.min,
              alignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonAgentStop(),
                ButtonAgentDelete(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _agentCardImage(String image_url) {
  return Container(
    height: 120.0,
    child: SizedBox(
      child: Ink.image(
        image: NetworkImage(image_url),
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _agentCardListTile(String title, String subtitle) {
  return ListTile(
    title: Text(title),
    subtitle: Text(subtitle),
    trailing: Icon(Icons.favorite_outline),
  );
}

Widget _agentCardSupportingText(String supporting) {
  return Container(
    padding: const EdgeInsets.all(16.0),
    alignment: Alignment.centerLeft,
    child: Text(supporting),
  );
}

import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_screen_add_agent.dart';
import 'package:flutter/material.dart';

class WorkingAgentCard extends StatefulWidget {
  final String text;
  final String imagePath;
  final String subtitle;
  final String supporting;
  const WorkingAgentCard(
      {super.key,
      required this.text,
      required this.imagePath,
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
          _agentCardImage(widget.imagePath),
          _agentCardListTile(widget.text, widget.subtitle),
          _agentCardSupportingText(widget.supporting),
          Align(
            alignment: Alignment.bottomCenter,
            child: ButtonBar(
              // mainAxisSize: MainAxisSize.min,
              alignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ButtonTaskRedirect(
                  text: widget.text,
                  subtitle: widget.subtitle,
                  supporting: widget.supporting,
                ),
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

Widget _agentCardImage(String imagePath) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(
          15.0), // Задайте радиус скругления для верхнего левого угла
      topRight: Radius.circular(
          15.0), // Задайте радиус скругления для верхнего правого угла
    ),
    child: SizedBox(
      child: Image.asset(
        '$imagePath', // Путь к вашей картинке
        width: 250.0,
        height: 120.0,
        fit:
            BoxFit.fill, // Выберите подходящий вариант для отображения картинки
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

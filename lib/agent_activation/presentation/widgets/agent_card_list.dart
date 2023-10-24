import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_card.dart';
import 'package:flutter/material.dart';

List<Widget> buildCardList(List<String> cardData) {
  return cardData.map((text) {
    return SizedBox(
        child: WorkingAgentCard(
      text: text,
    ));
  }).toList();
}

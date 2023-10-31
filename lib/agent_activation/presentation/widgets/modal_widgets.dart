import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget CircularImage(String imagePath) {
  return Container(
    width: 168.0,
    height: 168.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    ),
    margin: EdgeInsets.all(10.0),
    child: ClipOval(
      child: Image.asset(
        '$imagePath', // Путь к вашей картинке
        width: 168.0,
        height: 168.0,
        fit: BoxFit
            .cover, // Выберите подходящий вариант для отображения картинки
      ),
    ),
  );
}

Widget AgentNameField(
    BuildContext context, TextEditingController textController) {
  return SizedBox(
    width: 200,
    child: TextField(
      controller: textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: AppLocalizations.of(context).enterAgentName,
      ),
    ),
  );
}

Widget AimField(BuildContext context, TextEditingController textController) {
  return SizedBox(
    width: 200,
    child: TextField(
      controller: textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: "Цель Агента:",
      ),
    ),
  );
}

class StepSlider extends StatefulWidget {
  const StepSlider({super.key});

  @override
  State<StepSlider> createState() => _StepSliderState();
}

class _StepSliderState extends State<StepSlider> {
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _currentSliderValue,
        max: 20,
        divisions: 20,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
        });
  }
}

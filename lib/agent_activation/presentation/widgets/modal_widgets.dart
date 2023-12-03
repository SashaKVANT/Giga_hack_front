import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget CircularImage(String imagePath) {
  return Container(
    width: 250.0,
    height: 250.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
    ),
    margin: EdgeInsets.all(10.0),
    child: ClipOval(
      child: Image.asset(
        '$imagePath', // Путь к вашей картинке
        width: 250.0,
        height: 250.0,
        fit: BoxFit
            .cover, // Выберите подходящий вариант для отображения картинки
      ),
    ),
  );
}

Widget AgentNameField(
    BuildContext context, TextEditingController textController) {
  return SizedBox(
    width: 400,
    child: TextField(
      textAlign: TextAlign.center,
      controller: textController,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: AppLocalizations.of(context).enterAgentName,
      ),
    ),
  );
}

Widget ChannelField(
    BuildContext context, TextEditingController textController) {
  return SizedBox(
    width: 400,
    height: 60,
    child: TextField(
      maxLines: 4,
      controller: textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: AppLocalizations.of(context).enterAgentAim,
      ),
    ),
  );
}

Widget AuditoryField(
    BuildContext context, TextEditingController textController) {
  return SizedBox(
    width: 400,
    height: 60,
    child: TextField(
      maxLines: 4,
      controller: textController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        hintText: "Целевая аудитория",
      ),
    ),
  );
}

Widget TextAboveSlider(BuildContext context) {
  return SizedBox(
    width: 400,
    child: Text(
      AppLocalizations.of(context).enterAgentSteps,
      style: Theme.of(context).textTheme.bodyLarge,
    ),
  );
}

class SliderValueNotifier extends ValueNotifier<double> {
  SliderValueNotifier(double value) : super(value);
}

class StepSlider extends StatefulWidget {
  final SliderValueNotifier sliderValueNotifier;
  const StepSlider({Key? key, required this.sliderValueNotifier})
      : super(key: key);
  @override
  State<StepSlider> createState() => _StepSliderState();
}

class _StepSliderState extends State<StepSlider> {
  double _currentSliderValue = 1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Slider(
        value: _currentSliderValue,
        max: 20,
        divisions: 20,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
          widget.sliderValueNotifier.value = value;
        },
      ),
    );
  }
}

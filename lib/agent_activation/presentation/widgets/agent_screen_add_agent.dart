import 'package:autogpt_frontend/agent_activation/data/api/stop_agent.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/modal_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonAgentAdd extends StatelessWidget {
  final VoidCallback onIncrement;
  const ButtonAgentAdd({super.key, required this.onIncrement});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onIncrement,
      child: Icon(Icons.add),
    );
  }
}

class ButtonAgentStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          makeStopApiRequest();
          print('Агент остановлен');
        },
        child: Text(AppLocalizations.of(context).stopAgent),
      ),
    );
  }
}

class ButtonAgentDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          print('Удален агент');
        },
        child: Icon(
          Icons.delete_rounded,
          color: Color.fromARGB(179, 3, 3, 3),
        ),
      ),
    );
  }
}

class ButtonTaskRedirect extends StatelessWidget {
  final String text;
  final String subtitle;
  final String supporting;
  const ButtonTaskRedirect(
      {super.key,
      required this.text,
      required this.subtitle,
      required this.supporting});

  Future<void> _showModal(BuildContext context) async {
    List<String>? result = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return _modalAgentWindow(context, text, subtitle, supporting);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          print('Перешли в окно задачи');
          _showModal(context);
        },
        child: Icon(
          Icons.arrow_outward,
          color: Color.fromARGB(179, 3, 3, 3),
        ),
      ),
    );
  }
}

Widget _modalAgentWindow(
  BuildContext context,
  String text,
  String subtitle,
  String supporting,
) {
  return Dialog(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: 400,
          child: TextField(
            controller: TextEditingController(text: text),
            readOnly: true, // Запретить редактирование
            decoration: InputDecoration(labelText: 'Моё имя'),
          ),
        ),
        SizedBox(
          width: 400,
          child: TextField(
            controller: TextEditingController(text: subtitle),
            readOnly: true,
            decoration: InputDecoration(labelText: 'Столько шагов я сделал'),
          ),
        ),
        SizedBox(
          width: 400,
          child: TextField(
            controller: TextEditingController(text: supporting),
            readOnly: true,
            decoration: InputDecoration(labelText: 'Такую задачу я решал'),
          ),
        ),
        //Еще один Stful Widget, мб запихнуть с state экрана?
      ],
    ),
  );
}

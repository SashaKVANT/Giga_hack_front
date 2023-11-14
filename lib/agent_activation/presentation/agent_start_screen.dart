// import 'package:autogpt_frontend/agent_activation/presentation/screen_test.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_card.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_screen_add_agent.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/modal_widgets.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/text_button_above_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AgentStartScreen extends StatefulWidget {
  const AgentStartScreen({super.key});

  @override
  State<AgentStartScreen> createState() => _AgentStartScreenState();
}

class _AgentStartScreenState extends State<AgentStartScreen> {
  late int? _selectedIndex;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;
  double groupAlignment = -1.0;

  String agentName = "";
  List<String> agentNames = [];

  String aimText = "";
  List<String> aimTexts = [];

  void cardCounter(List<String>? result) {
    if (result != null) {
      String agentNameText = result[0]; // Получить первый элемент
      String aimText = result[1];
      // Получить второй элемент
      setState(() {
        agentNames.add('$agentNameText');
        aimTexts.add('$aimText');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = null; // Начальное значение null
  }

  void _onDestinationSelected(int index) {
    setState(() {
      print('change stage');
      //   _selectedIndex = index;
      // });
      // if (_selectedIndex == 0) {
      //   Navigator.pushNamed(context, '/B');
      // } else if (_selectedIndex == 1) {
      //   Navigator.pushNamed(context, '/C');
    });
  }

  // Тест навигации

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NavigationRail(
                backgroundColor: Color(0xFF2E4BE6),
                // minWidth: 100.0,
                selectedIndex: _selectedIndex,
                groupAlignment: groupAlignment,
                onDestinationSelected: _onDestinationSelected,
                labelType: labelType,
                destinations: _destinationsMenuEdit()),
            const VerticalDivider(thickness: 1, width: 1),
            // This is the main content.
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(48.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      RowAboveCard(),
                      SizedBox(
                        height: 30,
                      ),
                      GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisExtent: 305,
                        ),
                        itemCount: agentNames.length,
                        shrinkWrap:
                            true, // Чтобы GridView не занимал бесконечно много места
                        itemBuilder: (BuildContext context, int index) {
                          return _gridElement(
                              context, agentNames, aimTexts, index);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showModal(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _gridElement(BuildContext context, List<String> agentNames,
      List<String> aimTexts, int index) {
    return WorkingAgentCard(
      text: agentNames[index],
      image_url: 'https://source.unsplash.com/random/800x600?green',
      subtitle: "subtitile!",
      supporting: aimTexts[index],
    );
  }

  Future<void> _showModal(BuildContext context) async {
    TextEditingController agentNameController = TextEditingController();
    TextEditingController aimController = TextEditingController();

    List<String>? result = await showDialog<List<String>>(
      context: context,
      builder: (BuildContext context) {
        return _modalWindow(context, agentNameController, aimController);
      },
    );

    cardCounter(result);
  }
}

Widget _modalWindow(
    BuildContext context,
    TextEditingController agentNameController,
    TextEditingController aimController) {
  return Dialog(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircularImage('../../../assets/agent_nevill.png'),
        AgentNameField(context, agentNameController),
        AimField(context, aimController),
        TextAboveSlider(context),
        StepSlider(), //Еще один Stful Widget, мб запихнуть с state экрана?
        ElevatedButton(
          onPressed: () {
            List<String> AgentNameAimTexts = [
              agentNameController.text,
              aimController.text
            ];
            Navigator.of(context).pop(AgentNameAimTexts);
          },
          child: Text(AppLocalizations.of(context).enterAgentDone),
        ),
      ],
    ),
  );
}

List<NavigationRailDestination> _destinationsMenuEdit() {
  return [
    const NavigationRailDestination(
      icon: Icon(
        Icons.menu_rounded,
        color: Color(0xFFFFFFFF),
      ),
      selectedIcon: Icon(
        Icons.menu_open_rounded,
      ),
      label: Text('Menu'),
    ),
    const NavigationRailDestination(
      icon: Icon(
        Icons.edit_outlined,
        color: Color(0xFFFFFFFF),
      ),
      selectedIcon: Icon(
        Icons.edit,
      ),
      label: Text('Edit'),
    ),
  ];
}

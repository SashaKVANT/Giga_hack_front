// import 'package:autogpt_frontend/agent_activation/presentation/screen_test.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/agent_card.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/button_agent_add.dart';
import 'package:autogpt_frontend/agent_activation/presentation/widgets/text_button_above_card.dart';
import 'package:flutter/material.dart';

class AgentStartScreen extends StatefulWidget {
  const AgentStartScreen({super.key});

  @override
  State<AgentStartScreen> createState() => _AgentStartScreenState();
}

class _AgentStartScreenState extends State<AgentStartScreen> {
  late int? _selectedIndex;
  NavigationRailLabelType labelType = NavigationRailLabelType.none;
  double groupAlignment = -1.0;

  List<String> cardData = [
    'Карточка 1',
  ];

  void cardCounter() {
    setState(() {
      cardData.add('Карточка ${cardData.length + 1}');
    });
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisExtent: 305,
                          ),
                          itemCount: cardData.length,
                          shrinkWrap:
                              true, // Чтобы GridView не занимал бесконечно много места
                          physics:
                              NeverScrollableScrollPhysics(), // Отключить прокрутку GridView
                          itemBuilder: (BuildContext context, int index) {
                            return _gridElement(context, cardData, index);
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
        floatingActionButton: ButtonAgentAdd(
          onIncrement: cardCounter,
        ));
  }
}

Widget _gridElement(BuildContext context, List<String> cardData, int index) {
  return WorkingAgentCard(
    text: cardData[index],
    image_url: 'https://source.unsplash.com/random/800x600?green',
    subtitle: "subheading",
    supporting: "supportingText",
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

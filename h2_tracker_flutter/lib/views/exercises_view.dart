import 'package:flutter/material.dart';

class ExercisesView extends StatefulWidget {
  const ExercisesView({super.key});

  @override
  ExercisesViewState createState() => ExercisesViewState();
}

class ExercisesViewState extends State<ExercisesView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          extended: true,
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.timeline_rounded),
              selectedIcon: Icon(Icons.timeline_rounded),
              label: Text(
                'Histórico',
                style: TextStyle(fontSize: 16),
              ),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.add),
              selectedIcon: Icon(Icons.add),
              label: Text(
                'Criar Novo Treino',
                style: TextStyle(fontSize: 16),
              ),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.search_rounded),
              selectedIcon: Icon(Icons.search_rounded),
              label: Text(
                'Consultar Exercícios',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
        Expanded(
          child: Column(),
        )
      ]),
    );
  }
}

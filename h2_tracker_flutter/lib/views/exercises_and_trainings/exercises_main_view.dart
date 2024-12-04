import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/exercise_card.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/views/exercises_and_trainings/training_history_view.dart';
import 'package:h2_tracker_flutter/views/exercises_and_trainings/training_view.dart';
import 'package:h2_tracker_flutter/views/exercises_and_trainings/user_trainings_view.dart';

class ExercisesMainView extends StatefulWidget {
  const ExercisesMainView({super.key});

  @override
  ExercisesMainViewState createState() => ExercisesMainViewState();
}

class ExercisesMainViewState extends State<ExercisesMainView> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadData() async {
    final exercises = await client.exercicio.read();

    setState(() {
      _exercises = exercises;
    });
  }

  int _selectedIndex = 0;

  List<Exercicio> _exercises = [];

  void _navigateToRailIndex(int index, dynamic navigationArg) {
    setState(() {
      _selectedIndex = index;
      _navigationArg = navigationArg;
    });
  }

  dynamic _navigationArg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (int index) =>
              _navigateToRailIndex(index, null),
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
              icon: Icon(Icons.edit_calendar_rounded),
              selectedIcon: Icon(Icons.edit_calendar_rounded),
              label: Text(
                'Criar / ver Treino',
                style: TextStyle(fontSize: 16),
              ),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.calendar_today_rounded),
              selectedIcon: Icon(Icons.calendar_today_rounded),
              label: Text(
                'Consultar Treinos',
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
        if (_selectedIndex == 0)
          TrainingHistoryView(
            navigateToRailIndex: _navigateToRailIndex,
          )
        else if (_selectedIndex == 1)
          TrainingView(
            navigateToRailIndex: _navigateToRailIndex,
            treino: _navigationArg is Treino ? _navigationArg : null,
          )
        else if (_selectedIndex == 2)
          UserTrainingsView(navigateToRailIndex: _navigateToRailIndex)
        else if (_selectedIndex == 3)
          Expanded(
            child: GridView.count(
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 4,
                children: _exercises
                    .map((exercise) => ExerciseCard(
                        exercise: exercise,
                        onTap: () {
                          _showDialog(exercise);
                        }))
                    .toList()),
          )
      ]),
    );
  }

  void _showDialog(Exercicio exercise) {
    final size = MediaQuery.sizeOf(context);

    showDialog<TreinoExercicio>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(exercise.nome),
          content: SizedBox(
            height: size.height * .7,
            width: size.width * .7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: ExerciseCard(exercise: exercise, peek: true),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 24),
              ),
              child: const Text(
                'Fechar',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/main.dart';
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
    final theme = Theme.of(context);

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
          const Expanded(child: Text('Historico'))
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
                    .map((exercise) => _exerciseCard(
                        context: context,
                        exercise: exercise,
                        theme: theme,
                        onTap: () {}))
                    .toList()),
          )
      ]),
    );
  }

  Widget _exerciseCard(
      {required BuildContext context,
      required Exercicio exercise,
      required ThemeData theme,
      required void Function() onTap,
      TreinoExercicio? trainExercise}) {
    final size = MediaQuery.sizeOf(context);

    return Card(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: trainExercise != null ? Colors.blue : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.blueAccent,
                        width: size.width,
                      ),
                    ),
                    SizedBox(
                      height: 152,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Text(exercise.nome,
                              style: theme.textTheme.titleMedium),
                          Text(
                            exercise.grupoMuscular,
                            style: theme.textTheme.titleSmall,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              exercise.descricao,
                              maxLines: 3,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (trainExercise != null)
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        width: size.width,
                        height: 40,
                        color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Séries ${trainExercise.series.toString()}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Repetições ${trainExercise.repeticoes.toString()}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

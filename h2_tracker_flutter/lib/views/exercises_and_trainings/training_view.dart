import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/basic_form_field.dart';
import 'package:h2_tracker_flutter/components/select_goal.dart';
import 'package:h2_tracker_flutter/main.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({super.key, this.trainingId});

  final int? trainingId;

  @override
  TrainingViewState createState() => TrainingViewState();
}

class TrainingViewState extends State<TrainingView> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    _descricaoController.dispose();
    _setsController.dispose();
    _repsController.dispose();

    super.dispose();
  }

  Treino? _treino;

  Future<void> loadData() async {
    if (widget.trainingId != null) {
      final treino = await client.treino.findById(widget.trainingId!);
      setState(() {
        _treino = treino;
      });
    }

    final exercises = await client.exercicio.read();

    setState(() {
      _exercises = exercises;
    });
  }

  List<Exercicio> _exercises = [];
  final List<TreinoExercicio> _selectedExercises = [];

  String _selectedGoal = 'PERDA_DE_PESO';

  final _registerFormKey = GlobalKey<FormState>();
  final _descricaoController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();

  void _updateDropdownValue(String newValue) {
    setState(() {
      _selectedGoal = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _registerFormKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'Novo Treino',
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 26),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Descrição do Treino',
                style: theme.textTheme.titleLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: BasicFormField(
                controller: _descricaoController,
                textInputType: InputType.text,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Objetivo',
                style: theme.textTheme.titleLarge,
              ),
            ),
            SelectGoal(updateValue: _updateDropdownValue),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  final exercise = _exercises[index];

                  final selected = _selectedExercises
                      .where((trainExercise) =>
                          trainExercise.exercicioId == exercise.id)
                      .firstOrNull; //.contains(exercise);

                  return _exerciseCard(
                      context: context,
                      exercise: exercise,
                      theme: theme,
                      onTap: () {
                        if (selected == null) {
                          _dialogBuilder(context, exercise);
                        } else {
                          setState(() {
                            _selectedExercises.remove(selected);
                          });
                        }
                      },
                      trainExercise: selected);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FilledButton(
                onPressed: () async {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_registerFormKey.currentState!.validate()) {
                    final treinoExercicios = _selectedExercises;

                    final treino = Treino(
                        descricao: _descricaoController.text,
                        objetivo: _selectedGoal);

                    await client.treino.insert(treino, treinoExercicios);
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
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

  Future<void> _dialogBuilder(BuildContext context, Exercicio exercise) async {
    final result = await showDialog<TreinoExercicio>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Execução alvo do Exercício'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              BasicFormField(
                label: 'Séries',
                controller: _setsController,
                textInputType: InputType.smallNumber,
              ),
              const SizedBox(
                height: 16,
              ),
              BasicFormField(
                label: 'Repetições',
                controller: _repsController,
                textInputType: InputType.smallNumber,
              )
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Salvar'),
              onPressed: () {
                final exerciseTrain = TreinoExercicio(
                    repeticoes: int.parse(_repsController.text),
                    series: int.parse(_setsController.text),
                    treinoId: 0,
                    exercicioId: exercise.id!);

                Navigator.of(context).pop(exerciseTrain);
              },
            ),
          ],
        );
      },
    );
    if (result != null) {
      setState(() {
        _selectedExercises.add(result);
      });
    }
  }
}

import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/basic_form_field.dart';
import 'package:h2_tracker_flutter/components/exercise_card.dart';
import 'package:h2_tracker_flutter/components/select_goal.dart';
import 'package:h2_tracker_flutter/extensions/show_snack_bar.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class TrainingView extends StatefulWidget {
  const TrainingView(
      {super.key, this.treino, required this.navigateToRailIndex});

  final Treino? treino;
  final void Function(int, dynamic) navigateToRailIndex;

  @override
  TrainingViewState createState() => TrainingViewState();
}

class TrainingViewState extends State<TrainingView> {
  final UserStateService _userState = UserStateService();

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
    if (widget.treino != null) {
      final treino = widget.treino;

      setState(() {
        _treino = treino;
        if (treino != null) {
          _selectedGoal = treino.objetivo;
          _descricaoController.text = treino.descricao;
          if (treino.treinoExercicios != null &&
              treino.treinoExercicios!.isNotEmpty) {
            _selectedExercises.addAll(treino.treinoExercicios!);
          }
        }
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
                _treino != null ? 'Treino' : 'Novo Treino',
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

                  return ExerciseCard(
                    exercise: exercise,
                    onTap: () {
                      if (selected == null) {
                        _dialogBuilder(context, exercise, null);
                      } else {
                        setState(() {
                          _selectedExercises.remove(selected);
                        });
                      }
                    },
                    trainExercise: selected,
                    showTrainExercise: true,
                  );
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
                        pessoaId: _userState.user!.id!,
                        descricao: _descricaoController.text,
                        objetivo: _selectedGoal,
                        treinoExercicios: treinoExercicios);

                    if (_treino != null) {
                      treino.id = _treino!.id;
                      await client.treino.update(treino);
                    } else {
                      await client.treino.insert(treino);
                    }

                    showSnackBar(
                        context: context,
                        message: 'Treino salvo!',
                        status: SnackBarStatus.success);

                    widget.navigateToRailIndex(0, null);
                  } else {
                    showSnackBar(
                        context: context,
                        message: 'Treino inválido!',
                        status: SnackBarStatus.error);
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

  Future<void> _dialogBuilder(BuildContext context, Exercicio exercise,
      TreinoExercicio? treinoExercicio) async {
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
                if (treinoExercicio != null) {
                  treinoExercicio.series = int.parse(_setsController.text);
                  treinoExercicio.repeticoes = int.parse(_repsController.text);

                  Navigator.of(context).pop(treinoExercicio);
                } else {
                  final exerciseTrain = TreinoExercicio(
                      repeticoes: int.parse(_repsController.text),
                      series: int.parse(_setsController.text),
                      treinoId: _treino != null ? _treino!.id! : 0,
                      exercicioId: exercise.id!);
                  Navigator.of(context).pop(exerciseTrain);
                }
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

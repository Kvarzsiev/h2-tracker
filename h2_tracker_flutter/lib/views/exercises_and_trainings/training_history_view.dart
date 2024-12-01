import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/exercise_card.dart';
import 'package:h2_tracker_flutter/functions/date.dart';
import 'package:h2_tracker_flutter/functions/show_snack_bar.dart';
import 'package:h2_tracker_flutter/functions/string.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';
import 'package:timelines_plus/timelines_plus.dart';

class TrainingHistoryView extends StatefulWidget {
  const TrainingHistoryView({super.key, required this.navigateToRailIndex});

  final void Function(int, dynamic) navigateToRailIndex;

  @override
  TrainingHistoryViewState createState() => TrainingHistoryViewState();
}

class TrainingHistoryViewState extends State<TrainingHistoryView> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = true;
    });
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final UserStateService _userState = UserStateService();

  List<TreinoHistorico> _historico = [];
  List<Treino> _treinos = [];

  Treino? _selectedTrain;
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  DateTime? _start;
  DateTime? _end;

  Future<void> loadData() async {
    final historico =
        await client.treinoHistorico.readUserTrainHistory(_userState.user!.id!);

    final treinos = await client.pessoa.readUserTrainings(_userState.user!.id!);

    print(treinos);

    setState(() {
      _historico = historico;
      _treinos = treinos;
      if (_treinos.isNotEmpty) _selectedTrain = _treinos.first;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (_loading) {
      return const Center(
          child: CircularProgressIndicator(
        color: Colors.blue,
      ));
    } else {
      return Expanded(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    'Histórico',
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 32),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextButton.icon(
                        label: const Text('Adicionar'),
                        style: const ButtonStyle(
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.all(
                              16,
                            ),
                          ),
                        ),
                        iconAlignment: IconAlignment.end,
                        onPressed: () {
                          if (_treinos.isNotEmpty) {
                            _dialogBuilder(context);
                          } else {
                            showSnackBar(
                                context: context,
                                message: 'Cadastre algum treino antes!',
                                status: SnackBarStatus.error);
                          }
                        },
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Timeline.tileBuilder(
              builder: TimelineTileBuilder.fromStyle(
                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) {
                  final historyItem = _historico[index];

                  final card = Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.grey.withOpacity(
                            .2,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            Text(
                              historyItem.treino!.descricao,
                              style: theme.textTheme.titleLarge,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Expanded(
                              child: Image.network(
                                historyItem.treino!.treinoExercicios!.first
                                    .exercicio!.imagem,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Início ${historyItem.horarioInicio.formatToPtBr(PtBrFormat.medium)}',
                                  style: theme.textTheme.titleMedium,
                                ),
                                Text(
                                  'Fim ${historyItem.horarioFim.formatToPtBr(PtBrFormat.medium)}',
                                  style: theme.textTheme.titleMedium,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                  return card;
                },
                itemCount: _historico.length,
              ),
            ),
          )
        ],
      ));
    }
  }

  Future<void> _dialogBuilder(
    BuildContext context,
  ) async {
    final size = MediaQuery.sizeOf(context);

    await showDialog<TreinoExercicio>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Adicionar treino realizado'),
          content: SizedBox(
            height: size.height * .7,
            width: size.width * .5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButton<int>(
                  value: _selectedTrain?.id ?? _treinos.first.id,
                  padding: const EdgeInsets.all(8),
                  isExpanded: true,
                  onChanged: (int? value) {
                    if (value != null) {
                      setState(() {
                        _selectedTrain =
                            _treinos.firstWhere((treino) => treino.id == value);
                      });
                    }
                  },
                  focusColor: Colors.lightBlueAccent[100]?.withOpacity(0.1),
                  items: _treinos
                      .map(
                        (treino) => DropdownMenuItem<int>(
                          key: Key(treino.id!.toString()),
                          value: treino.id,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                '${treino.descricao} - Objetivo: ${treino.objetivo.toReadableTitle()}'),
                          ),
                        ),
                      )
                      .toList(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: _startDateController, // Assign the controller
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today), // Calendar icon
                    ),
                    readOnly: true, // Make the field read-only
                    onTap: () {
                      _selectDate(context, 'start');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: _endDateController, // Assign the controller
                    decoration: const InputDecoration(
                      labelText: 'Select Date',
                      suffixIcon: Icon(Icons.calendar_today), // Calendar icon
                    ),
                    readOnly: true, // Make the field read-only
                    onTap: () {
                      _selectDate(context, 'end');
                    },
                  ),
                ),
                if (_selectedTrain != null &&
                    _selectedTrain!.treinoExercicios != null)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                      ),
                      itemCount: _selectedTrain!.treinoExercicios!.length,
                      itemBuilder: (context, index) {
                        final exercise =
                            _selectedTrain!.treinoExercicios![index];

                        return ExerciseCard(
                          exercise: exercise.exercicio!,
                          trainExercise: exercise,
                          trainExerciseHistory: true,
                        );
                      },
                    ),
                  )
              ],
            ),
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
              onPressed: () async {
                print(_selectedTrain);

                if (_selectedTrain != null && _start != null && _end != null) {
                  final newHistoryEntry = TreinoHistorico(
                    treinoId: _selectedTrain!.id!,
                    horarioInicio: _start!,
                    horarioFim: _end!,
                  );

                  await client.treinoHistorico.insert(newHistoryEntry);

                  showSnackBar(
                    context: context,
                    message: 'Novo registro adicionado ao histórico!',
                    status: SnackBarStatus.success,
                  );

                  loadData();
                } else {
                  showSnackBar(
                    context: context,
                    message: 'Preencha todos os campos!',
                    status: SnackBarStatus.error,
                  );
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context, String date) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime.now(), // Minimum date
      lastDate: DateTime(2100), // Maximum date
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        // Combine date and time
        final selectedDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
        if (date == 'start') {
          setState(() {
            _startDateController.text =
                selectedDateTime.formatToPtBr(PtBrFormat.medium);
            _start = selectedDateTime;
          });
        } else {
          setState(() {
            _endDateController.text =
                selectedDateTime.formatToPtBr(PtBrFormat.medium);
            _end = selectedDateTime;
          });
        }
      }
    }
  }
}

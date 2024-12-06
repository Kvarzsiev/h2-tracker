import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/new_train_history.dart';
import 'package:h2_tracker_flutter/extensions/date.dart';
import 'package:h2_tracker_flutter/extensions/show_snack_bar.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';
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
  DateTime? _start;
  DateTime? _end;
  final TextEditingController _typeAheadController = TextEditingController();

  Future<void> loadData() async {
    final historico =
        await client.treinoHistorico.readUserTrainHistory(_userState.user!.id!);

    final treinos = await client.pessoa.readUserTrainings(_userState.user!.id!);

    setState(() {
      _historico = historico;
      _treinos = treinos;
      if (_treinos.isNotEmpty) {
        _selectedTrain = _treinos.first;
        _typeAheadController.text = _treinos.first.descricao;
      }
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
                            _dialogBuilder(context, null);
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
                      child: InkWell(
                        onTap: () {
                          _dialogBuilder(context, historyItem);
                        },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
      BuildContext context, TreinoHistorico? historico) async {
    final hasHistory = historico != null;

    await showDialog<TreinoExercicio>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(hasHistory
              ? 'Ver Histórico: ${historico.treino!.descricao} - Objetivo: ${historico.treino!.objetivo.toReadableTitle()}'
              : 'Adicionar treino realizado'),
          content: NewTrainHistory(
            historico: historico,
            suggestionsCallback: (searchVal) {
              return _treinos
                  .where(
                    (element) =>
                        element.descricao.toLowerCase().contains(
                              searchVal.toLowerCase(),
                            ) ||
                        element.objetivo
                            .toLowerCase()
                            .contains(searchVal.toLowerCase()),
                  )
                  .toList();
            },
            selectDate: _updateDate,
            selectTrain: (Treino treino) {
              setState(() {
                _selectedTrain = treino;
              });
            },
            selectedTrain: _selectedTrain!,
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 24),
              ),
              child: Text(
                !hasHistory ? 'Cancelar' : 'Sair',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            if (!hasHistory)
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(fontSize: 24),
                ),
                child: const Text('Salvar'),
                onPressed: () async {
                  if (_selectedTrain != null &&
                      _start != null &&
                      _end != null) {
                    var newHistoryEntry = TreinoHistorico(
                      treinoId: _selectedTrain!.id!,
                      horarioInicio: _start!,
                      horarioFim: _end!,
                    );

                    newHistoryEntry =
                        await client.treinoHistorico.insert(newHistoryEntry);

                    final newExerciseHistoryEntries = _selectedTrain!
                        .treinoExercicios!
                        .where((element) =>
                            element.treinoExercicioHistoricos != null &&
                            element.treinoExercicioHistoricos!.isNotEmpty)
                        .map((element) =>
                            element.treinoExercicioHistoricos!.first)
                        .toList()
                      ..forEach((element) =>
                          element.treinoHistoricoId = newHistoryEntry.id!);

                    await client.treinoExercicioHistorico
                        .insert(newExerciseHistoryEntries);

                    showSnackBar(
                      context: context,
                      message: 'Novo registro adicionado ao histórico!',
                      status: SnackBarStatus.success,
                    );

                    setState(() {
                      _selectedTrain = null;
                      _start = null;
                      _end = null;
                    });

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

  void _updateDate(String date, DateTime selectedDateTime) {
    if (date == 'start') {
      setState(() {
        _start = selectedDateTime;
      });
    } else {
      setState(() {
        _end = selectedDateTime;
      });
    }
  }
}

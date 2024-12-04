import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
    this.onTap,
    this.trainExercise,
    this.trainExerciseHistory,
    this.insertTrainExerciseHistory = false,
    this.showTrainExercise = false,
  });

  final Exercicio exercise;
  final void Function()? onTap;
  final TreinoExercicio? trainExercise;
  final TreinoExercicioHistorico? trainExerciseHistory;
  final bool insertTrainExerciseHistory;
  final bool showTrainExercise;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
            child: trainExercise != null && showTrainExercise
                ? Stack(
                    children: [
                      _mainCardContent(size, theme),
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
                                    'Séries ${trainExercise!.series.toString()}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'Repetições ${trainExercise!.repeticoes.toString()}',
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                : _mainCardContent(size, theme),
          ),
        ),
      ),
    );
  }

  Column _mainCardContent(Size size, ThemeData theme) {
    final hasTrainExerciseHistory =
        (insertTrainExerciseHistory || trainExerciseHistory != null) &&
            trainExercise != null;

    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: size.width,
            child: Image.network(exercise.imagem),
          ),
        ),
        Column(
          children: [
            if (!hasTrainExerciseHistory)
              const SizedBox(
                height: 30,
              ),
            Text(exercise.nome, style: theme.textTheme.titleMedium),
            Text(
              exercise.grupoMuscular,
              style: theme.textTheme.titleSmall,
            ),
            if (!hasTrainExerciseHistory)
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
        if (hasTrainExerciseHistory)
          SizedBox(
            height: 48,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (trainExerciseHistory == null) ...[
                    const Text(
                      'Nova progressão: ',
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(
                            8,
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                          ),
                          hintText: 'kg',
                          hintStyle: TextStyle(
                            fontSize: 13,
                            color: Colors.blueAccent[100],
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        onChanged: (String newValue) {
                          final newExerciseHistory = TreinoExercicioHistorico(
                              treinoExercicioId: trainExercise!.id!,
                              progressao: newValue,
                              treinoHistoricoId: -1);

                          trainExercise!.treinoExercicioHistoricos = [
                            newExerciseHistory
                          ];
                        },
                      ),
                    ),
                  ] else
                    Text('${trainExerciseHistory!.progressao} kg')
                ],
              ),
            ),
          ),
      ],
    );
  }
}

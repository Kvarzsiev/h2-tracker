import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.exercise,
    this.onTap,
    this.trainExercise,
    this.trainExerciseHistory = false,
    this.showTrainExercise = false,
  });

  final Exercicio exercise;
  final void Function()? onTap;
  final TreinoExercicio? trainExercise;
  final bool trainExerciseHistory;
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
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: size.width,
                        child: Image.network(exercise.imagem),
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
                if (trainExercise != null && showTrainExercise)
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
                else if (trainExerciseHistory && trainExercise != null)
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
                              child: Row(
                                children: [
                                  const Text(
                                    'Nova progressão ',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextField(
                                    cursorColor: Colors.white,
                                    decoration:
                                        const InputDecoration(border: null),
                                    onChanged: (String newValue) {
                                      final newExerciseHistory =
                                          TreinoExercicioHistorico(
                                        treinoExercicioId: trainExercise!.id!,
                                        progressao: newValue,
                                      );

                                      trainExercise!.treinoExercicioHistoricos =
                                          [newExerciseHistory];
                                    },
                                  )
                                ],
                              ),
                            ),
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

import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/extensions/color.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';

class DietCard extends StatelessWidget {
  const DietCard({
    super.key,
    required this.diet,
    this.onTap,
    //this.trainExercise,
    //this.trainExerciseHistory,
    //this.insertTrainExerciseHistory = false,
    //this.showTrainExercise = false,
    //this.peek = false,
  });

  final Dieta diet;
  final void Function()? onTap;
  //final TreinoExercicio? trainExercise;
  //final TreinoExercicioHistorico? trainExerciseHistory;
  //final bool insertTrainExerciseHistory;
  //final bool showTrainExercise;
  //final bool peek;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Card(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.lighten(90).withOpacity(.5),
          border: Border.all(
            color: diet.ativa ? Colors.blue : Colors.transparent,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: _mainCardContent(size, theme),
          ),
        ),
      ),
    );
  }

  String _getImage(String dietFocus) {
    switch (dietFocus) {
      case 'PERDA_DE_PESO':
        {
          return 'assets/images/lean.png';
        }

      case 'GANHO_DE_PESO':
        {
          return 'assets/images/gain.jpg';
        }

      case 'GANHO_DE_MASSA_MAGRA':
        {
          return 'assets/images/muscle.png';
        }

      case 'MANUTENCAO_DE_PESO':
        {
          return 'assets/images/maintain.jpg';
        }
      default:
        return 'assets/images/maintain.jpg';
    }
  }

  Column _mainCardContent(Size size, ThemeData theme) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: size.width,
            child: Image.asset(
              _getImage(diet.objetivo),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          children: [
            Text(diet.objetivo.toReadableTitle(),
                style: theme.textTheme.titleMedium),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                diet.descricao,
                maxLines: 3,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: null),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

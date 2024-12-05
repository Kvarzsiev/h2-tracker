import 'dart:math';

import 'package:h2_tracker_server/src/endpoints/alimento_endpoint.dart';
import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class StaticRefeicaoEndpoint {
  static Future<void> staticInsert(Session session, Dieta dieta) async {
    final alimentos = await StaticAlimentoEndpoint.staticRead(session);

    final proteinOptions =
        alimentos.where((a) => a.tipo == 'Proteína').toList();
    final carbOptions =
        alimentos.where((a) => a.tipo == 'Carboidrato').toList();
    final sideOptions =
        alimentos.where((a) => a.tipo == 'Acompanhamento').toList();
    Random random = Random();
    for (var i = 0; i < 3; i++) {
      final calories = (i == 0
              ? dieta.caloriasMaximasDia * .3
              : i == 1
                  ? dieta.caloriasMaximasDia * .4
                  : dieta.caloriasMaximasDia * .3)
          .round();

      final halfMealCalories = calories / 2;

      final protein1 =
          proteinOptions.removeAt(random.nextInt(proteinOptions.length));
      final protein1Quantity =
          _calculateGrams(halfMealCalories, protein1.caloriasGrama);
      final carb1 = carbOptions.removeAt(random.nextInt(carbOptions.length));
      final side1 = sideOptions.removeAt(random.nextInt(sideOptions.length));

      print('I $i PL ${proteinOptions.length}');
      final protein2 =
          proteinOptions.removeAt(random.nextInt(proteinOptions.length));
      final protein2Quantity =
          _calculateGrams(halfMealCalories, protein2.caloriasGrama);
      final carb2 = carbOptions.removeAt(random.nextInt(carbOptions.length));
      final side2 = sideOptions.removeAt(random.nextInt(sideOptions.length));

      final mealProtein = ((protein1Quantity * protein1.proteinasGrama / 100) +
              (protein2Quantity * protein2.proteinasGrama / 100)) /
          2;

      var refeicao = Refeicao(
        calorias: calories,
        proteinas: mealProtein.round(),
        dietaId: dieta.id!,
        descricao: '',
      );

      refeicao = await Refeicao.db.insertRow(session, refeicao);

      final opcoesAlimentos = [
        OpcaoAlimento(
          refeicaoId: refeicao.id!,
          quantidade: protein1Quantity,
          alimentoId: protein1.id!,
        ),
        OpcaoAlimento(
          refeicaoId: refeicao.id!,
          quantidade: _calculateGrams(halfMealCalories, carb1.caloriasGrama),
          alimentoId: carb1.id!,
        ),
        OpcaoAlimento(
          refeicaoId: refeicao.id!,
          quantidade: 100,
          alimentoId: side1.id!,
        ),
        OpcaoAlimento(
          refeicaoId: refeicao.id!,
          quantidade: protein2Quantity,
          alimentoId: protein2.id!,
        ),
        OpcaoAlimento(
          refeicaoId: refeicao.id!,
          quantidade: _calculateGrams(halfMealCalories, carb2.caloriasGrama),
          alimentoId: carb2.id!,
        ),
        OpcaoAlimento(
          refeicaoId: refeicao.id!,
          quantidade: 100,
          alimentoId: side2.id!,
        ),
      ];

      await OpcaoAlimento.db.insert(session, opcoesAlimentos);
    }
  }

  static int _calculateGrams(double maxCal, int foodCals) {
    return ((maxCal / foodCals) * 100).round();
  }
}

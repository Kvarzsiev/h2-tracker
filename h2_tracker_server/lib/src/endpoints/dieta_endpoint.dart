import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class DietaEndpoint extends Endpoint {
  int _taxaMetabolicaBasalGerica(
      double peso, double altura, int idade, String sexo) {
    if (sexo == 'M') {
      return (88.36 + (13.4 * peso) + (4.8 * altura) - (5.7 * idade)).round();
    } else {
      return (447.6 + (9.2 * peso) + (3.1 * altura) - (4.3 * idade)).round();
    }
  }

  Future<void> insert(Session session, Dieta dieta, double peso, double altura,
      int idade, String sexo) async {
    final taxaMetabolicaBasalGenerica =
        _taxaMetabolicaBasalGerica(peso, altura, idade, sexo);

    switch (dieta.objetivo) {
      case 'PERDA_DE_PESO':
        {
          dieta.caloriasMaximasDia =
              (taxaMetabolicaBasalGenerica - 500).round();
          break;
        }

      case 'GANHO_DE_PESO':
        {
          dieta.caloriasMaximasDia =
              (taxaMetabolicaBasalGenerica + 400).round();
          break;
        }

      case 'GANHO_DE_MASSA_MAGRA':
        {
          dieta.caloriasMaximasDia =
              (taxaMetabolicaBasalGenerica + 250).round();
          break;
        }

      case 'MANUTENCAO_DE_PESO':
        {
          dieta.caloriasMaximasDia = taxaMetabolicaBasalGenerica.round();
          break;
        }
    }

    await Dieta.db.insertRow(session, dieta);
  }

  Future<void> update(Session session, Dieta dieta, double peso, double altura,
      int idade, String sexo) async {
    final taxaMetabolicaBasalGenerica =
        _taxaMetabolicaBasalGerica(peso, altura, idade, sexo);

    switch (dieta.objetivo) {
      case 'PERDA_DE_PESO':
        {
          dieta.caloriasMaximasDia =
              (taxaMetabolicaBasalGenerica - 500).round();
          break;
        }

      case 'GANHO_DE_PESO':
        {
          dieta.caloriasMaximasDia =
              (taxaMetabolicaBasalGenerica + 400).round();
          break;
        }

      case 'GANHO_DE_MASSA_MAGRA':
        {
          dieta.caloriasMaximasDia =
              (taxaMetabolicaBasalGenerica + 250).round();
          break;
        }

      case 'MANUTENCAO_DE_PESO':
        {
          dieta.caloriasMaximasDia = taxaMetabolicaBasalGenerica.round();
          break;
        }
    }

    await Dieta.db.updateRow(session, dieta);
  }
}

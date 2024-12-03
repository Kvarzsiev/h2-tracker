import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PesoEndpoint extends Endpoint {
  Future<void> insert(Session session, Peso peso, double height) async {
    _calculateIMC(height, peso);

    await Peso.db.insertRow(session, peso);
  }

  void _calculateIMC(double height, Peso peso) {
    final metersHeight = height / 100;

    final realIMC = peso.peso / (metersHeight * metersHeight);

    peso.imc = realIMC;
  }

  Future<void> updateHeight(Session session, int userId, double height) async {
    final pesos = await Peso.db
        .find(session, where: (table) => table.pessoaId.equals(userId));

    for (final peso in pesos) {
      _calculateIMC(height, peso);
    }

    await Peso.db.update(session, pesos);
  }
}

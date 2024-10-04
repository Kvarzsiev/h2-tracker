import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PesoEndpoint extends Endpoint {
  Future<void> insert(Session session, Peso peso, double height) async {
    final metersHeight = height / 100;
    final realIMC = peso.peso / metersHeight * metersHeight;

    peso.imc = realIMC;

    await Peso.db.insertRow(session, peso);
  }
}

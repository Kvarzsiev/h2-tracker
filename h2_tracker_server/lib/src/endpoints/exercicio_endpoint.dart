import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ExercicioEndpoint extends Endpoint {
  Future<void> insert(Session session, Exercicio exercicio) async {
    await Exercicio.db.insertRow(session, exercicio);
  }

  Future<List<Exercicio>> read(Session session) async {
    return await Exercicio.db.find(session);
  }

  Future<void> delete(Session session, Exercicio exercicio) async {
    await Exercicio.db.deleteRow(session, exercicio);
  }
}

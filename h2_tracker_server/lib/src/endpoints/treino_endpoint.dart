import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TreinoEndpoint extends Endpoint {
  Future<void> insert(Session session, Treino treino) async {
    await Treino.db.insertRow(session, treino);
  }

  Future<List<Treino>> read(Session session) async {
    return await Treino.db.find(session);
  }

  Future<void> delete(Session session, Treino treino) async {
    await Treino.db.deleteRow(session, treino);
  }
}

import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TreinoEndpoint extends Endpoint {
  Future<void> insert(
      Session session, Treino treino, List<TreinoExercicio> exercises) async {
    final treinoInstance = await Treino.db.insertRow(session, treino);

    for (final exercise in exercises) {
      exercise.treinoId = treinoInstance.id!;
    }

    await TreinoExercicio.db.insert(session, exercises);
  }

  Future<List<Treino>> read(Session session, int userId) async {
    //final user = await Pessoa.db.findFirstRow(session,
    //    where: (tb) => (tb.email.equals(email)) & (tb.senha.equals(password)));

    return await Treino.db.find(session);
  }

  Future<Treino?> findById(Session session, int id) async {
    return await Treino.db.findById(session, id);
  }

  Future<void> delete(Session session, Treino treino) async {
    await Treino.db.deleteRow(session, treino);
  }
}

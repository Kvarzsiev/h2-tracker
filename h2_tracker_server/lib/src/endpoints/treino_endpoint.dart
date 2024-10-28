import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TreinoEndpoint extends Endpoint {
  Future<void> insert(Session session, Treino treino) async {
    final treinoInstance = await Treino.db.insertRow(session, treino);

    if (treino.treinoExercicios != null &&
        treino.treinoExercicios!.isNotEmpty) {
      for (final treinoExercicio in treino.treinoExercicios!) {
        treinoExercicio.treinoId = treinoInstance.id!;
      }

      print(treino.treinoExercicios!.toJson());

      TreinoExercicio.db.insert(session, treino.treinoExercicios!);
    }
  }

  Future<void> update(Session session, Treino treino) async {
    print(treino);

    await Treino.db.updateRow(session, treino);

    if (treino.treinoExercicios != null &&
        treino.treinoExercicios!.isNotEmpty) {
      final exerciciosAntigos = treino.treinoExercicios!
          .where((treinoExercicio) => treinoExercicio.id != null)
          .toList();

      await TreinoExercicio.db.update(session, exerciciosAntigos);

      final novosExercicios = treino.treinoExercicios!
          .where((treinoExercicio) => treinoExercicio.id == null)
          .toList();

      await TreinoExercicio.db.insert(session, novosExercicios);
    }
  }

  Future<Treino?> findById(Session session, int id) async {
    return await Treino.db.findById(session, id);
  }

  Future<void> delete(Session session, Treino treino) async {
    await Treino.db.deleteRow(session, treino);
  }
}

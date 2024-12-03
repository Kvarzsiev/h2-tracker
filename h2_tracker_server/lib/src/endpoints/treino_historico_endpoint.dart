import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TreinoHistoricoEndpoint extends Endpoint {
  Future<List<TreinoHistorico>> readUserTrainHistory(
      Session session, int userId) async {
    final history = await TreinoHistorico.db.find(
      session,
      where: (treinoHistorico) =>
          treinoHistorico.treino.pessoaId.equals(userId),
      include: TreinoHistorico.include(
        treino: Treino.include(
            treinoExercicios: TreinoExercicio.includeList(
          include: TreinoExercicio.include(
            exercicio: Exercicio.include(),
          ),
        )),
      ),
      orderDescending: true,
      orderBy: (table) => table.horarioFim,
    );

    return history;
  }

  Future<void> insert(Session session, TreinoHistorico historico,
      List<TreinoExercicioHistorico> treinoExercicioHistoricos) async {
    await TreinoHistorico.db.insertRow(session, historico);

    await TreinoExercicioHistorico.db
        .insert(session, treinoExercicioHistoricos);
  }

  Future<void> update(Session session, Treino treino) async {
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
}

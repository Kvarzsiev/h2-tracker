import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class TreinoExercicioHistoricoEndpoint extends Endpoint {
  Future<void> insert(Session session,
      List<TreinoExercicioHistorico> treinoExercicioHistoricos) async {
    await TreinoExercicioHistorico.db
        .insert(session, treinoExercicioHistoricos);
  }

  Future<List<TreinoExercicioHistorico>> readUserTrainHistory(
      Session session, int userId, int exerciseId) async {
    final history = await TreinoExercicioHistorico.db.find(
      session,
      where: (exercicioHistorico) =>
          (exercicioHistorico.treinoExercicio.exercicio.id.equals(
                exerciseId,
              ) &
              exercicioHistorico.treinoHistorico.treino.pessoaId.equals(
                userId,
              )),
      include: TreinoExercicioHistorico.include(
        treinoExercicio: TreinoExercicio.include(
          exercicio: Exercicio.include(),
        ),
        treinoHistorico: TreinoHistorico.include(
          treino: Treino.include(
            pessoa: Pessoa.include(),
          ),
        ),
      ),
      orderBy: (table) => table.treinoHistorico.horarioFim,
    );

    return history;
  }
}

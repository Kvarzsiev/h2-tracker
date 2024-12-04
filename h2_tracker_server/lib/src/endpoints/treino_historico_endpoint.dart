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
        treinoHistoricoExercicios: TreinoExercicioHistorico.includeList(),
        treino: Treino.include(
          treinoExercicios: TreinoExercicio.includeList(
            include: TreinoExercicio.include(
              exercicio: Exercicio.include(),
            ),
          ),
        ),
      ),
      orderDescending: true,
      orderBy: (table) => table.horarioFim,
    );

    return history;
  }

  Future<TreinoHistorico> insert(
    Session session,
    TreinoHistorico historico,
  ) async {
    return await TreinoHistorico.db.insertRow(session, historico);
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

  Future<int?> queryTrainFrequencyThisWeek(Session session, int userId) async {
    final result = await session.db.unsafeQuery(
        r'SELECT COUNT(DISTINCT DATE(h."horarioFim")) AS frequencia_diaria FROM Pessoa p JOIN Treino t ON t."pessoaId" = p.id JOIN treino_historico h ON h."treinoId" = t.id WHERE h."horarioFim" >= CURRENT_DATE - 7 and p.id = @userId',
        parameters: QueryParameters.named({
          'userId': userId,
        }));
    if (result.first.first != null) {
      return result.first.first;
    }
    return null;
  }
}

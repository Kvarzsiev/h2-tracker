import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class PessoaEndpoint extends Endpoint {
  Future<Pessoa> insert(Session session, Pessoa pessoa) async {
    return await Pessoa.db.insertRow(session, pessoa);
  }

  Future<void> delete(Session session, Pessoa pessoa) async {
    await Pessoa.db.deleteRow(session, pessoa);
  }

  Future<void> update(Session session, Pessoa pessoa) async {
    await Pessoa.db.updateRow(session, pessoa);
  }

  Future<Pessoa> login(Session session, String email, String password) async {
    final user = await Pessoa.db.findFirstRow(
      session,
      where: (tb) => (tb.email.equals(email)) & (tb.senha.equals(password)),
      include: Pessoa.include(
        historicoPeso: Peso.includeList(
          orderDescending: true,
          orderBy: (table) => table.dataPesagem,
        ),
        historicoDietas: Dieta.includeList(
          orderDescending: true,
          orderBy: (table) => table.dataFim,
        ),
        treinos: Treino.includeList(
          include: Treino.include(
            treinoExercicios: TreinoExercicio.includeList(
              include: TreinoExercicio.include(
                treinoExercicioHistoricos:
                    TreinoExercicioHistorico.includeList(),
              ),
            ),
          ),
        ),
      ),
    );

    if (user != null) {
      return user;
    } else {
      throw Exception('Não autorizado');
    }
  }

  Future<List<Treino>> readUserTrainings(Session session, int userId) async {
    final user = await Pessoa.db.findById(
      session,
      userId,
      include: Pessoa.include(
        treinos: Treino.includeList(
          include: Treino.include(
            treinoExercicios: TreinoExercicio.includeList(
              include: TreinoExercicio.include(
                exercicio: Exercicio.include(),
              ),
            ),
          ),
        ),
      ),
    );

    return user?.treinos ?? [];
  }

  Future<Pessoa> read(Session session, int id) async {
    final pessoa = await Pessoa.db.findById(
      session,
      id,
      include: Pessoa.include(
        historicoPeso: Peso.includeList(
          orderDescending: true,
          orderBy: (table) => table.dataPesagem,
        ),
        historicoDietas: Dieta.includeList(
          orderDescending: true,
          orderBy: (table) => table.dataFim,
        ),
        treinos: Treino.includeList(
          include: Treino.include(
            treinoExercicios: TreinoExercicio.includeList(
              include: TreinoExercicio.include(
                treinoExercicioHistoricos:
                    TreinoExercicioHistorico.includeList(),
              ),
            ),
          ),
        ),
      ),
    );

    if (pessoa != null) {
      return pessoa;
    } else {
      throw Exception('Não encontrado');
    }
  }
}

import 'package:h2_tracker_server/src/generated/pessoa.dart';
import 'package:serverpod/serverpod.dart';

class PessoaEndpoint extends Endpoint {
  Future<Pessoa> insert(Session session, Pessoa pessoa) async {
    return await Pessoa.db.insertRow(session, pessoa);
  }

  Future<void> delete(Session session, Pessoa pessoa) async {
    await Pessoa.db.deleteRow(session, pessoa);
  }

  Future<Pessoa?> login(Session session, String email, String password) async {
    try {
      final result = await Pessoa.db.find(
        session,
        where: (tb) => tb.email.equals(email) & tb.senha.equals(password),
      );

      if (result.isEmpty) {
        throw Exception('Email ou senha inválidos.');
      }

      final user = result.first;
      return user;
    } catch (e) {
      rethrow;
    }
  }
}

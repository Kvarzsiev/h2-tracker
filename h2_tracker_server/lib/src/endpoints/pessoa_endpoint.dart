import 'package:h2_tracker_server/src/generated/pessoa.dart';
import 'package:serverpod/serverpod.dart';

class PessoaEndpoint extends Endpoint {
  Future<Pessoa> insert(Session session, Pessoa pessoa) async {
    return await Pessoa.db.insertRow(session, pessoa);
  }

  Future<void> delete(Session session, Pessoa pessoa) async {
    await Pessoa.db.deleteRow(session, pessoa);
  }

  Future<Pessoa> login(Session session, String email, String password) async {
    final user = await Pessoa.db.findFirstRow(session,
        where: (tb) => (tb.email.equals(email)) & (tb.senha.equals(password)));

    if (user != null) {
      return user;
    } else {
      throw Exception('Não autorizado');
    }
  }
}

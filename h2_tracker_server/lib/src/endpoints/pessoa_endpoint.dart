import 'package:h2_tracker_server/src/generated/pessoa.dart';
import 'package:serverpod/serverpod.dart';

class PessoaEndpoint extends Endpoint {
  Future<void> insert(Session session, Pessoa pessoa) async {
    await Pessoa.db.insertRow(session, pessoa);
  }

  Future<void> delete(Session session, Pessoa pessoa) async {
    await Pessoa.db.deleteRow(session, pessoa);
  }

  Future<void> login(Session session, String email, String password) async {
    await Pessoa.db.find(session,
        where: (tb) => (tb.email.equals(email)) & (tb.senha.equals(password)));
  }
}

import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ExercicioEndpoint extends Endpoint {
  Future<void> insert(Session session, Exercicio exercicio) async {
    await Exercicio.db.insertRow(session, exercicio);
  }

  Future<List<Exercicio>> read(Session session) async {
    print('read');
    final exercises = await Exercicio.db.find(session);
    if (exercises.isEmpty) {
      print('ISEMPTY');
      await insertDefault(session);

      return await Exercicio.db.find(session);
    } else {
      return exercises;
    }
  }

  Future<void> delete(Session session, Exercicio exercicio) async {
    await Exercicio.db.deleteRow(session, exercicio);
  }

  Future<void> insertDefault(Session session) async {
    print('inSERT');
    await Exercicio.db.insert(session, [
      Exercicio(
          nome: 'Agachamento com Barra',
          grupoMuscular: 'Perna',
          descricao:
              'Posicionar a barra acima da cervical, agachar em linha reta.'),
      Exercicio(
          nome: 'Rosca Direta com Barra W',
          grupoMuscular: 'Biceps',
          descricao:
              'Pegar barra W levantar até encostar, ou quase encostar, no peito, descer até encostar na coxa. Cuide para não balançar muito o corpo durante o movimento.'),
      Exercicio(
          nome: 'Supino Reto com Barra',
          grupoMuscular: 'Peito',
          descricao:
              'Deitado, pegar barra com pegada supinada, empurrar a barra em linha reta para cima, mantenha os cotovelos pouco afastados do tórax.'),
      Exercicio(
          nome: 'Supino Reto com Barra',
          grupoMuscular: 'Peito',
          descricao: 'Supino Reto com Barra'),
      Exercicio(
          nome: 'Remada na Polia Baixa com Triângulo',
          grupoMuscular: 'Peito',
          descricao: 'Supino Reto com Barra')
    ]);
  }
}

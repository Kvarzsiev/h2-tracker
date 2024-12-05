import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class StaticAlimentoEndpoint {
  static Future<List<Alimento>> staticRead(Session session) async {
    return await Alimento.db.find(session);
  }
}

class AlimentoEndpoint extends Endpoint {
  Future<void> insertDefault(Session session) async {
    await Alimento.db.insert(session, [
      Alimento(
          descricao: 'Peito de Frango (sem pele)',
          proteinasGrama: 31,
          caloriasGrama: 165,
          tipo: 'Proteína'),
      Alimento(
        descricao: 'Carne Vermelha (patinho ou alcatra)',
        proteinasGrama: 26,
        caloriasGrama: 250,
        tipo: 'Proteína',
      ),
      Alimento(
        descricao: 'Tilápia',
        proteinasGrama: 20,
        caloriasGrama: 96,
        tipo: 'Proteína',
      ),
      Alimento(
        descricao: 'Salmão',
        proteinasGrama: 25,
        caloriasGrama: 206,
        tipo: 'Proteína',
      ),
      Alimento(
        descricao: 'Ovo',
        proteinasGrama: 13,
        caloriasGrama: 143,
        tipo: 'Proteína',
      ),
      Alimento(
        descricao: 'Atum Enlatado',
        proteinasGrama: 25,
        caloriasGrama: 116,
        tipo: 'Proteína',
      ),
      Alimento(
        descricao: 'Quinoa',
        proteinasGrama: 4,
        caloriasGrama: 120,
        tipo: 'Carboidrato',
      ),
      Alimento(
        descricao: 'Arroz Branco',
        proteinasGrama: 3,
        caloriasGrama: 130,
        tipo: 'Carboidrato',
      ),
      Alimento(
        descricao: 'Batata Inglesa',
        proteinasGrama: 2,
        caloriasGrama: 86,
        tipo: 'Carboidrato',
      ),
      Alimento(
        descricao: 'Batata Doce',
        proteinasGrama: 2,
        caloriasGrama: 86,
        tipo: 'Carboidrato',
      ),
      Alimento(
        descricao: 'Pão Integral',
        proteinasGrama: 9,
        caloriasGrama: 252,
        tipo: 'Carboidrato',
      ),
      Alimento(
        descricao: 'Macarrão Integral',
        proteinasGrama: 5,
        caloriasGrama: 124,
        tipo: 'Carboidrato',
      ),
      Alimento(
        descricao: 'Brócolis',
        proteinasGrama: 3,
        caloriasGrama: 35,
        tipo: 'Acompanhamento',
      ),
      Alimento(
        descricao: 'Espinafre',
        proteinasGrama: 3,
        caloriasGrama: 23,
        tipo: 'Acompanhamento',
      ),
      Alimento(
        descricao: 'Cenoura',
        proteinasGrama: 1,
        caloriasGrama: 41,
        tipo: 'Acompanhamento',
      ),
      Alimento(
        descricao: 'Cogumelos',
        proteinasGrama: 3,
        caloriasGrama: 22,
        tipo: 'Acompanhamento',
      ),
      Alimento(
        descricao: 'Pimentão Vermelho',
        proteinasGrama: 1,
        caloriasGrama: 31,
        tipo: 'Acompanhamento',
      ),
      Alimento(
        descricao: 'Abobrinha Cozida',
        proteinasGrama: 1,
        caloriasGrama: 17,
        tipo: 'Acompanhamento',
      ),
    ]);
  }
}

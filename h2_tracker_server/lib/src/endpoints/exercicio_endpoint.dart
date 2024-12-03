import 'package:h2_tracker_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ExercicioEndpoint extends Endpoint {
  Future<void> insert(Session session, Exercicio exercicio) async {
    await Exercicio.db.insertRow(session, exercicio);
  }

  Future<List<Exercicio>> read(Session session) async {
    final exercises = await Exercicio.db.find(session);
    if (exercises.isEmpty) {
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
    await Exercicio.db.insert(session, [
      Exercicio(
          nome: 'Supino Reto com Halteres',
          grupoMuscular: 'Peito',
          descricao:
              'Deite-se de costas em um banco plano, segurando dois halteres sobre o peito com uma pegada em pronação. Abaixe os pesos até o peito, mantendo os cotovelos a um ângulo de 45 graus em relação ao torso. Empurre os halteres de volta para a posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/dumbbell-bench-press_0.jpg'),
      Exercicio(
          nome: 'Supino Inclinado com Halteres',
          grupoMuscular: 'Peito',
          descricao:
              'Deite-se de costas em um banco inclinado, segurando dois halteres acima do peito com uma pegada em pronação. Abaixe os halteres até o peito superior, mantendo os cotovelos a um ângulo de 45 graus em relação ao torso. Empurre os halteres de volta para a posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/incline-dumbbell-bench-press_0.jpg'),
      Exercicio(
          nome: 'Crucifixo Inclinado com Halteres',
          grupoMuscular: 'Peito',
          descricao:
              'Deite-se de costas em um banco inclinado e segure um haltere em cada mão acima do peito. Abaixe os braços para os lados do corpo em um arco largo, mantendo uma leve flexão nos cotovelos. Levante os halteres de volta para a posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/incline-dumbbell-fly-thumb.jpg'),
      Exercicio(
          nome: 'Crossover na Polia',
          grupoMuscular: 'Peito',
          descricao:
              'Ajuste ambos os polias para a configuração alta e segure um cabo em cada mão. Dê um pequeno passo à frente, puxe os braços juntos à frente do corpo e depois retorne lentamente à posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/styles/800x500/public/cable-crossovers-upper-chest.jpg'),
      Exercicio(
          nome: 'Crucifixo Deitado',
          grupoMuscular: 'Peito',
          descricao:
              'Deite-se em um banco plano, segurando um haltere em cada mão, estendido acima do peito. Abaixe lentamente os halteres para os lados em um arco largo, depois retorne à posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/dumbbell-fly.jpg'),
      Exercicio(
          nome: 'Supino Reto com Barra',
          grupoMuscular: 'Peito',
          descricao:
              'Deite-se de costas em um banco plano e segure uma barra sobre o peito com uma pegada em pronação. Abaixe a barra até o peito, mantendo os cotovelos a um ângulo de 45 graus em relação ao torso, e depois empurre a barra de volta para cima.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/barbell-bench-press_0.jpg'),
      Exercicio(
          nome: 'Pullover com Halter',
          grupoMuscular: 'Peito/Costas',
          descricao:
              'Deite-se em um banco plano, segurando um haltere com ambas as mãos acima do peito. Abaixe o haltere para trás da cabeça, depois puxe-o de volta para o peito.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/dumbbell-pullover.jpg'),
      Exercicio(
          nome: 'Elevação Lateral com Halteres',
          grupoMuscular: 'Ombros',
          descricao:
              'Segure um haltere em cada mão e levante os braços para os lados, mantendo uma leve flexão nos cotovelos. Levante os braços até que fiquem alinhados com os ombros, depois abaixe-os de volta.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/dumbbell-lateral-raise.jpg'),
      Exercicio(
          nome: 'Encolhimento com Barra',
          grupoMuscular: 'Costas',
          descricao:
              'Fique de pé segurando uma barra na frente do corpo. Encolha os ombros o máximo possível, depois abaixe-os de volta',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/barbell-shrug-1.jpg'),
      Exercicio(
          nome: 'Barra',
          grupoMuscular: 'Costas',
          descricao:
              'Segure a barra de pull-up com uma pegada em pronação. Puxe-se até que o queixo ultrapasse a barra e depois abaixe-se de volta.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/pull-up-1.jpg'),
      Exercicio(
          nome: 'Pulley Pegada Aberta',
          grupoMuscular: 'Costas',
          descricao:
              'Sente-se na máquina de Pulley e segure a barra com uma pegada em pronação. Puxe a barra até o peito, depois retorne lentamente à posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/lat-pull-down.jpg'),
      Exercicio(
          nome: 'Remada Sentado',
          grupoMuscular: 'Costas',
          descricao:
              'Sente-se na máquina de remada e segure as alças. Puxe as alças em direção ao torso, apertando as escápulas, depois retorne à posição inicial.',
          imagem:
              'https://cdn.muscleandstrength.com/sites/default/files/seated-row-rope-extension.jpg'),
      Exercicio(
        nome: 'Barra Paralela',
        grupoMuscular: 'Peito',
        descricao:
            'Segure as barras de dip com as palmas das mãos voltadas para dentro. Abaixe o corpo lentamente, dobrando os cotovelos, mantendo o torso ereto. Quando os braços superiores estiverem paralelos ao chão, empurre-se de volta para a posição inicial.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/chest-dip.jpg',
      ),
      Exercicio(
        nome: 'Fly no Cabo',
        grupoMuscular: 'Peito',
        descricao:
            'Fique no centro de uma máquina de cabo com ambas as polias ajustadas à altura do peito. Segure as alças com as mãos e, com uma leve flexão nos cotovelos, traga as mãos juntas à frente do peito. Retorne lentamente à posição inicial.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/standing-cable-fly1.jpg',
      ),
      Exercicio(
        nome: 'Agachamento com Barra',
        grupoMuscular: 'Pernas',
        descricao:
            'Fique de pé com os pés afastados na largura dos ombros e a barra repousando nas costas superiores. Abaixe o corpo dobrando os joelhos e os quadris, mantendo o peito ereto e as costas retas. Desça até que as coxas fiquem paralelas ao chão ou mais, depois empurre-se de volta para a posição inicial.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/barbell-back-squat.jpg',
      ),
      Exercicio(
        nome: 'Leg Press',
        grupoMuscular: 'Pernas',
        descricao:
            'Sente-se na máquina de leg press com os pés afastados na largura dos ombros na plataforma. Abaixe o peso dobrando os joelhos e depois empurre o peso de volta para a posição inicial, certificando-se de não bloquear os joelhos no topo.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/leg-press.jpg',
      ),
      Exercicio(
        nome: 'Levantamento Terra',
        grupoMuscular: 'Costas/Pernas',
        descricao:
            'Fique de pé com os pés afastados na largura dos ombros e a barra na frente das canelas. Dobre os joelhos e abaixe os quadris para segurar a barra com uma pegada em pronação. Mantenha as costas retas enquanto se levanta, levantando a barra ao estender os quadris e joelhos. Abaixe a barra de volta ao chão mantendo uma boa forma.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/deadlift_0.jpg',
      ),
      Exercicio(
        nome: 'Remada Curvada com Barra',
        grupoMuscular: 'Costas',
        descricao:
            'Fique de pé com os pés afastados na largura dos ombros, segurando uma barra com uma pegada em pronação. Dobre ligeiramente os joelhos e incline-se para frente, mantendo as costas retas. Puxe a barra em direção ao torso, apertando as escápulas, depois abaixe-a lentamente de volta à posição inicial.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/bent-over-row.jpg',
      ),
      Exercicio(
        nome: 'Flexor Sentado',
        grupoMuscular: 'Pernas',
        descricao:
            'Sente-se na máquina de leg curl com as pernas estendidas à frente e os tornozelos sob a alavanca acolchoada. Dobre as pernas em direção às nádegas, apertando os isquiotibiais no topo, depois retorne lentamente à posição inicial.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/seated-leg-curl-1.jpg',
      ),
      Exercicio(
        nome: 'Levantamento Terra Romeno',
        grupoMuscular: 'Pernas',
        descricao:
            'Fique de pé com os pés na largura dos quadris e a barra na frente das coxas. Mantenha as costas retas enquanto abaixa a barra empurrando os quadris para trás e dobrando na cintura. Abaixe a barra até sentir um alongamento nos isquiotibiais, depois volte à posição em pé empurrando os quadris para frente.',
        imagem:
            'https://cdn.muscleandstrength.com/sites/default/files/romanian-deadlift.jpg',
      ),
    ]);
  }
}

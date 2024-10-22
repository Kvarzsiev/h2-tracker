import 'package:h2_tracker_server/server.dart';

void main(List<String> args) async {
  try {
    run(args);
  } catch (e) {
    print('Erro ao iniciar o servidor: $e');
  }
}

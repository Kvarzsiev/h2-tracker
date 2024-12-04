/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/dieta_endpoint.dart' as _i2;
import '../endpoints/example_endpoint.dart' as _i3;
import '../endpoints/exercicio_endpoint.dart' as _i4;
import '../endpoints/exercicio_historico_endpoint.dart' as _i5;
import '../endpoints/peso_endpoint.dart' as _i6;
import '../endpoints/pessoa_endpoint.dart' as _i7;
import '../endpoints/treino_endpoint.dart' as _i8;
import '../endpoints/treino_historico_endpoint.dart' as _i9;
import 'package:h2_tracker_server/src/generated/dieta.dart' as _i10;
import 'package:h2_tracker_server/src/generated/exercicio.dart' as _i11;
import 'package:h2_tracker_server/src/generated/treino_exercicio_historico.dart'
    as _i12;
import 'package:h2_tracker_server/src/generated/peso.dart' as _i13;
import 'package:h2_tracker_server/src/generated/pessoa.dart' as _i14;
import 'package:h2_tracker_server/src/generated/treino.dart' as _i15;
import 'package:h2_tracker_server/src/generated/treino_historico.dart' as _i16;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'dieta': _i2.DietaEndpoint()
        ..initialize(
          server,
          'dieta',
          null,
        ),
      'example': _i3.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
      'exercicio': _i4.ExercicioEndpoint()
        ..initialize(
          server,
          'exercicio',
          null,
        ),
      'treinoExercicioHistorico': _i5.TreinoExercicioHistoricoEndpoint()
        ..initialize(
          server,
          'treinoExercicioHistorico',
          null,
        ),
      'peso': _i6.PesoEndpoint()
        ..initialize(
          server,
          'peso',
          null,
        ),
      'pessoa': _i7.PessoaEndpoint()
        ..initialize(
          server,
          'pessoa',
          null,
        ),
      'treino': _i8.TreinoEndpoint()
        ..initialize(
          server,
          'treino',
          null,
        ),
      'treinoHistorico': _i9.TreinoHistoricoEndpoint()
        ..initialize(
          server,
          'treinoHistorico',
          null,
        ),
    };
    connectors['dieta'] = _i1.EndpointConnector(
      name: 'dieta',
      endpoint: endpoints['dieta']!,
      methodConnectors: {
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'dieta': _i1.ParameterDescription(
              name: 'dieta',
              type: _i1.getType<_i10.Dieta>(),
              nullable: false,
            ),
            'peso': _i1.ParameterDescription(
              name: 'peso',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'altura': _i1.ParameterDescription(
              name: 'altura',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'idade': _i1.ParameterDescription(
              name: 'idade',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sexo': _i1.ParameterDescription(
              name: 'sexo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dieta'] as _i2.DietaEndpoint).insert(
            session,
            params['dieta'],
            params['peso'],
            params['altura'],
            params['idade'],
            params['sexo'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'dieta': _i1.ParameterDescription(
              name: 'dieta',
              type: _i1.getType<_i10.Dieta>(),
              nullable: false,
            ),
            'peso': _i1.ParameterDescription(
              name: 'peso',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'altura': _i1.ParameterDescription(
              name: 'altura',
              type: _i1.getType<double>(),
              nullable: false,
            ),
            'idade': _i1.ParameterDescription(
              name: 'idade',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sexo': _i1.ParameterDescription(
              name: 'sexo',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['dieta'] as _i2.DietaEndpoint).update(
            session,
            params['dieta'],
            params['peso'],
            params['altura'],
            params['idade'],
            params['sexo'],
          ),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i3.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    connectors['exercicio'] = _i1.EndpointConnector(
      name: 'exercicio',
      endpoint: endpoints['exercicio']!,
      methodConnectors: {
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'exercicio': _i1.ParameterDescription(
              name: 'exercicio',
              type: _i1.getType<_i11.Exercicio>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['exercicio'] as _i4.ExercicioEndpoint).insert(
            session,
            params['exercicio'],
          ),
        ),
        'read': _i1.MethodConnector(
          name: 'read',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['exercicio'] as _i4.ExercicioEndpoint).read(session),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'exercicio': _i1.ParameterDescription(
              name: 'exercicio',
              type: _i1.getType<_i11.Exercicio>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['exercicio'] as _i4.ExercicioEndpoint).delete(
            session,
            params['exercicio'],
          ),
        ),
        'insertDefault': _i1.MethodConnector(
          name: 'insertDefault',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['exercicio'] as _i4.ExercicioEndpoint)
                  .insertDefault(session),
        ),
      },
    );
    connectors['treinoExercicioHistorico'] = _i1.EndpointConnector(
      name: 'treinoExercicioHistorico',
      endpoint: endpoints['treinoExercicioHistorico']!,
      methodConnectors: {
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'treinoExercicioHistoricos': _i1.ParameterDescription(
              name: 'treinoExercicioHistoricos',
              type: _i1.getType<List<_i12.TreinoExercicioHistorico>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treinoExercicioHistorico']
                      as _i5.TreinoExercicioHistoricoEndpoint)
                  .insert(
            session,
            params['treinoExercicioHistoricos'],
          ),
        ),
        'readUserTrainHistory': _i1.MethodConnector(
          name: 'readUserTrainHistory',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'exerciseId': _i1.ParameterDescription(
              name: 'exerciseId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treinoExercicioHistorico']
                      as _i5.TreinoExercicioHistoricoEndpoint)
                  .readUserTrainHistory(
            session,
            params['userId'],
            params['exerciseId'],
          ),
        ),
      },
    );
    connectors['peso'] = _i1.EndpointConnector(
      name: 'peso',
      endpoint: endpoints['peso']!,
      methodConnectors: {
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'peso': _i1.ParameterDescription(
              name: 'peso',
              type: _i1.getType<_i13.Peso>(),
              nullable: false,
            ),
            'height': _i1.ParameterDescription(
              name: 'height',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['peso'] as _i6.PesoEndpoint).insert(
            session,
            params['peso'],
            params['height'],
          ),
        ),
        'updateHeight': _i1.MethodConnector(
          name: 'updateHeight',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'height': _i1.ParameterDescription(
              name: 'height',
              type: _i1.getType<double>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['peso'] as _i6.PesoEndpoint).updateHeight(
            session,
            params['userId'],
            params['height'],
          ),
        ),
      },
    );
    connectors['pessoa'] = _i1.EndpointConnector(
      name: 'pessoa',
      endpoint: endpoints['pessoa']!,
      methodConnectors: {
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'pessoa': _i1.ParameterDescription(
              name: 'pessoa',
              type: _i1.getType<_i14.Pessoa>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pessoa'] as _i7.PessoaEndpoint).insert(
            session,
            params['pessoa'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'pessoa': _i1.ParameterDescription(
              name: 'pessoa',
              type: _i1.getType<_i14.Pessoa>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pessoa'] as _i7.PessoaEndpoint).delete(
            session,
            params['pessoa'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'pessoa': _i1.ParameterDescription(
              name: 'pessoa',
              type: _i1.getType<_i14.Pessoa>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pessoa'] as _i7.PessoaEndpoint).update(
            session,
            params['pessoa'],
          ),
        ),
        'login': _i1.MethodConnector(
          name: 'login',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pessoa'] as _i7.PessoaEndpoint).login(
            session,
            params['email'],
            params['password'],
          ),
        ),
        'readUserTrainings': _i1.MethodConnector(
          name: 'readUserTrainings',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pessoa'] as _i7.PessoaEndpoint).readUserTrainings(
            session,
            params['userId'],
          ),
        ),
        'read': _i1.MethodConnector(
          name: 'read',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['pessoa'] as _i7.PessoaEndpoint).read(
            session,
            params['id'],
          ),
        ),
      },
    );
    connectors['treino'] = _i1.EndpointConnector(
      name: 'treino',
      endpoint: endpoints['treino']!,
      methodConnectors: {
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'treino': _i1.ParameterDescription(
              name: 'treino',
              type: _i1.getType<_i15.Treino>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treino'] as _i8.TreinoEndpoint).insert(
            session,
            params['treino'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'treino': _i1.ParameterDescription(
              name: 'treino',
              type: _i1.getType<_i15.Treino>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treino'] as _i8.TreinoEndpoint).update(
            session,
            params['treino'],
          ),
        ),
        'findById': _i1.MethodConnector(
          name: 'findById',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treino'] as _i8.TreinoEndpoint).findById(
            session,
            params['id'],
          ),
        ),
        'delete': _i1.MethodConnector(
          name: 'delete',
          params: {
            'treino': _i1.ParameterDescription(
              name: 'treino',
              type: _i1.getType<_i15.Treino>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treino'] as _i8.TreinoEndpoint).delete(
            session,
            params['treino'],
          ),
        ),
      },
    );
    connectors['treinoHistorico'] = _i1.EndpointConnector(
      name: 'treinoHistorico',
      endpoint: endpoints['treinoHistorico']!,
      methodConnectors: {
        'readUserTrainHistory': _i1.MethodConnector(
          name: 'readUserTrainHistory',
          params: {
            'userId': _i1.ParameterDescription(
              name: 'userId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treinoHistorico'] as _i9.TreinoHistoricoEndpoint)
                  .readUserTrainHistory(
            session,
            params['userId'],
          ),
        ),
        'insert': _i1.MethodConnector(
          name: 'insert',
          params: {
            'historico': _i1.ParameterDescription(
              name: 'historico',
              type: _i1.getType<_i16.TreinoHistorico>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treinoHistorico'] as _i9.TreinoHistoricoEndpoint)
                  .insert(
            session,
            params['historico'],
          ),
        ),
        'update': _i1.MethodConnector(
          name: 'update',
          params: {
            'treino': _i1.ParameterDescription(
              name: 'treino',
              type: _i1.getType<_i15.Treino>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['treinoHistorico'] as _i9.TreinoHistoricoEndpoint)
                  .update(
            session,
            params['treino'],
          ),
        ),
      },
    );
  }
}

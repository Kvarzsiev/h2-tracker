/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:h2_tracker_client/src/protocol/dieta.dart' as _i3;
import 'package:h2_tracker_client/src/protocol/exercicio.dart' as _i4;
import 'package:h2_tracker_client/src/protocol/treino_exercicio_historico.dart'
    as _i5;
import 'package:h2_tracker_client/src/protocol/peso.dart' as _i6;
import 'package:h2_tracker_client/src/protocol/pessoa.dart' as _i7;
import 'package:h2_tracker_client/src/protocol/treino.dart' as _i8;
import 'package:h2_tracker_client/src/protocol/treino_historico.dart' as _i9;
import 'protocol.dart' as _i10;

/// {@category Endpoint}
class EndpointDieta extends _i1.EndpointRef {
  EndpointDieta(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'dieta';

  _i2.Future<void> insert(
    _i3.Dieta dieta,
    double peso,
    double altura,
    int idade,
    String sexo,
  ) =>
      caller.callServerEndpoint<void>(
        'dieta',
        'insert',
        {
          'dieta': dieta,
          'peso': peso,
          'altura': altura,
          'idade': idade,
          'sexo': sexo,
        },
      );

  _i2.Future<void> update(
    _i3.Dieta dieta,
    double peso,
    double altura,
    int idade,
    String sexo,
  ) =>
      caller.callServerEndpoint<void>(
        'dieta',
        'update',
        {
          'dieta': dieta,
          'peso': peso,
          'altura': altura,
          'idade': idade,
          'sexo': sexo,
        },
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointExercicio extends _i1.EndpointRef {
  EndpointExercicio(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'exercicio';

  _i2.Future<void> insert(_i4.Exercicio exercicio) =>
      caller.callServerEndpoint<void>(
        'exercicio',
        'insert',
        {'exercicio': exercicio},
      );

  _i2.Future<List<_i4.Exercicio>> read() =>
      caller.callServerEndpoint<List<_i4.Exercicio>>(
        'exercicio',
        'read',
        {},
      );

  _i2.Future<void> delete(_i4.Exercicio exercicio) =>
      caller.callServerEndpoint<void>(
        'exercicio',
        'delete',
        {'exercicio': exercicio},
      );

  _i2.Future<void> insertDefault() => caller.callServerEndpoint<void>(
        'exercicio',
        'insertDefault',
        {},
      );
}

/// {@category Endpoint}
class EndpointTreinoExercicioHistorico extends _i1.EndpointRef {
  EndpointTreinoExercicioHistorico(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'treinoExercicioHistorico';

  _i2.Future<void> insert(
          List<_i5.TreinoExercicioHistorico> treinoExercicioHistoricos) =>
      caller.callServerEndpoint<void>(
        'treinoExercicioHistorico',
        'insert',
        {'treinoExercicioHistoricos': treinoExercicioHistoricos},
      );

  _i2.Future<List<_i5.TreinoExercicioHistorico>> readUserTrainHistory(
    int userId,
    int exerciseId,
  ) =>
      caller.callServerEndpoint<List<_i5.TreinoExercicioHistorico>>(
        'treinoExercicioHistorico',
        'readUserTrainHistory',
        {
          'userId': userId,
          'exerciseId': exerciseId,
        },
      );
}

/// {@category Endpoint}
class EndpointPeso extends _i1.EndpointRef {
  EndpointPeso(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'peso';

  _i2.Future<void> insert(
    _i6.Peso peso,
    double height,
  ) =>
      caller.callServerEndpoint<void>(
        'peso',
        'insert',
        {
          'peso': peso,
          'height': height,
        },
      );

  _i2.Future<void> updateHeight(
    int userId,
    double height,
  ) =>
      caller.callServerEndpoint<void>(
        'peso',
        'updateHeight',
        {
          'userId': userId,
          'height': height,
        },
      );
}

/// {@category Endpoint}
class EndpointPessoa extends _i1.EndpointRef {
  EndpointPessoa(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pessoa';

  _i2.Future<_i7.Pessoa> insert(_i7.Pessoa pessoa) =>
      caller.callServerEndpoint<_i7.Pessoa>(
        'pessoa',
        'insert',
        {'pessoa': pessoa},
      );

  _i2.Future<void> delete(_i7.Pessoa pessoa) => caller.callServerEndpoint<void>(
        'pessoa',
        'delete',
        {'pessoa': pessoa},
      );

  _i2.Future<void> update(_i7.Pessoa pessoa) => caller.callServerEndpoint<void>(
        'pessoa',
        'update',
        {'pessoa': pessoa},
      );

  _i2.Future<_i7.Pessoa> login(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<_i7.Pessoa>(
        'pessoa',
        'login',
        {
          'email': email,
          'password': password,
        },
      );

  _i2.Future<List<_i8.Treino>> readUserTrainings(int userId) =>
      caller.callServerEndpoint<List<_i8.Treino>>(
        'pessoa',
        'readUserTrainings',
        {'userId': userId},
      );

  _i2.Future<_i7.Pessoa> read(int id) => caller.callServerEndpoint<_i7.Pessoa>(
        'pessoa',
        'read',
        {'id': id},
      );
}

/// {@category Endpoint}
class EndpointTreino extends _i1.EndpointRef {
  EndpointTreino(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'treino';

  _i2.Future<void> insert(_i8.Treino treino) => caller.callServerEndpoint<void>(
        'treino',
        'insert',
        {'treino': treino},
      );

  _i2.Future<void> update(_i8.Treino treino) => caller.callServerEndpoint<void>(
        'treino',
        'update',
        {'treino': treino},
      );

  _i2.Future<_i8.Treino?> findById(int id) =>
      caller.callServerEndpoint<_i8.Treino?>(
        'treino',
        'findById',
        {'id': id},
      );

  _i2.Future<void> delete(_i8.Treino treino) => caller.callServerEndpoint<void>(
        'treino',
        'delete',
        {'treino': treino},
      );
}

/// {@category Endpoint}
class EndpointTreinoHistorico extends _i1.EndpointRef {
  EndpointTreinoHistorico(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'treinoHistorico';

  _i2.Future<List<_i9.TreinoHistorico>> readUserTrainHistory(int userId) =>
      caller.callServerEndpoint<List<_i9.TreinoHistorico>>(
        'treinoHistorico',
        'readUserTrainHistory',
        {'userId': userId},
      );

  _i2.Future<_i9.TreinoHistorico> insert(_i9.TreinoHistorico historico) =>
      caller.callServerEndpoint<_i9.TreinoHistorico>(
        'treinoHistorico',
        'insert',
        {'historico': historico},
      );

  _i2.Future<void> update(_i8.Treino treino) => caller.callServerEndpoint<void>(
        'treinoHistorico',
        'update',
        {'treino': treino},
      );
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i10.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    dieta = EndpointDieta(this);
    example = EndpointExample(this);
    exercicio = EndpointExercicio(this);
    treinoExercicioHistorico = EndpointTreinoExercicioHistorico(this);
    peso = EndpointPeso(this);
    pessoa = EndpointPessoa(this);
    treino = EndpointTreino(this);
    treinoHistorico = EndpointTreinoHistorico(this);
  }

  late final EndpointDieta dieta;

  late final EndpointExample example;

  late final EndpointExercicio exercicio;

  late final EndpointTreinoExercicioHistorico treinoExercicioHistorico;

  late final EndpointPeso peso;

  late final EndpointPessoa pessoa;

  late final EndpointTreino treino;

  late final EndpointTreinoHistorico treinoHistorico;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'dieta': dieta,
        'example': example,
        'exercicio': exercicio,
        'treinoExercicioHistorico': treinoExercicioHistorico,
        'peso': peso,
        'pessoa': pessoa,
        'treino': treino,
        'treinoHistorico': treinoHistorico,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

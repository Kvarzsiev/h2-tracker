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
import 'package:h2_tracker_client/src/protocol/peso.dart' as _i3;
import 'package:h2_tracker_client/src/protocol/pessoa.dart' as _i4;
import 'protocol.dart' as _i5;

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
class EndpointPeso extends _i1.EndpointRef {
  EndpointPeso(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'peso';

  _i2.Future<void> insert(
    _i3.Peso peso,
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
}

/// {@category Endpoint}
class EndpointPessoa extends _i1.EndpointRef {
  EndpointPessoa(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'pessoa';

  _i2.Future<_i4.Pessoa> insert(_i4.Pessoa pessoa) =>
      caller.callServerEndpoint<_i4.Pessoa>(
        'pessoa',
        'insert',
        {'pessoa': pessoa},
      );

  _i2.Future<void> delete(_i4.Pessoa pessoa) => caller.callServerEndpoint<void>(
        'pessoa',
        'delete',
        {'pessoa': pessoa},
      );

  _i2.Future<void> login(
    String email,
    String password,
  ) =>
      caller.callServerEndpoint<void>(
        'pessoa',
        'login',
        {
          'email': email,
          'password': password,
        },
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
          _i5.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    example = EndpointExample(this);
    peso = EndpointPeso(this);
    pessoa = EndpointPessoa(this);
  }

  late final EndpointExample example;

  late final EndpointPeso peso;

  late final EndpointPessoa pessoa;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'example': example,
        'peso': peso,
        'pessoa': pessoa,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}

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
import 'protocol.dart' as _i2;

abstract class OpcaoAlimento implements _i1.SerializableModel {
  OpcaoAlimento._({
    this.id,
    required this.quantidade,
    required this.refeicaoId,
    this.refeicao,
    required this.alimentoId,
    this.alimento,
  });

  factory OpcaoAlimento({
    int? id,
    required int quantidade,
    required int refeicaoId,
    _i2.Refeicao? refeicao,
    required int alimentoId,
    _i2.Alimento? alimento,
  }) = _OpcaoAlimentoImpl;

  factory OpcaoAlimento.fromJson(Map<String, dynamic> jsonSerialization) {
    return OpcaoAlimento(
      id: jsonSerialization['id'] as int?,
      quantidade: jsonSerialization['quantidade'] as int,
      refeicaoId: jsonSerialization['refeicaoId'] as int,
      refeicao: jsonSerialization['refeicao'] == null
          ? null
          : _i2.Refeicao.fromJson(
              (jsonSerialization['refeicao'] as Map<String, dynamic>)),
      alimentoId: jsonSerialization['alimentoId'] as int,
      alimento: jsonSerialization['alimento'] == null
          ? null
          : _i2.Alimento.fromJson(
              (jsonSerialization['alimento'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int quantidade;

  int refeicaoId;

  _i2.Refeicao? refeicao;

  int alimentoId;

  _i2.Alimento? alimento;

  OpcaoAlimento copyWith({
    int? id,
    int? quantidade,
    int? refeicaoId,
    _i2.Refeicao? refeicao,
    int? alimentoId,
    _i2.Alimento? alimento,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'quantidade': quantidade,
      'refeicaoId': refeicaoId,
      if (refeicao != null) 'refeicao': refeicao?.toJson(),
      'alimentoId': alimentoId,
      if (alimento != null) 'alimento': alimento?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OpcaoAlimentoImpl extends OpcaoAlimento {
  _OpcaoAlimentoImpl({
    int? id,
    required int quantidade,
    required int refeicaoId,
    _i2.Refeicao? refeicao,
    required int alimentoId,
    _i2.Alimento? alimento,
  }) : super._(
          id: id,
          quantidade: quantidade,
          refeicaoId: refeicaoId,
          refeicao: refeicao,
          alimentoId: alimentoId,
          alimento: alimento,
        );

  @override
  OpcaoAlimento copyWith({
    Object? id = _Undefined,
    int? quantidade,
    int? refeicaoId,
    Object? refeicao = _Undefined,
    int? alimentoId,
    Object? alimento = _Undefined,
  }) {
    return OpcaoAlimento(
      id: id is int? ? id : this.id,
      quantidade: quantidade ?? this.quantidade,
      refeicaoId: refeicaoId ?? this.refeicaoId,
      refeicao:
          refeicao is _i2.Refeicao? ? refeicao : this.refeicao?.copyWith(),
      alimentoId: alimentoId ?? this.alimentoId,
      alimento:
          alimento is _i2.Alimento? ? alimento : this.alimento?.copyWith(),
    );
  }
}

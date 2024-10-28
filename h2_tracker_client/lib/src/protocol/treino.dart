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

abstract class Treino implements _i1.SerializableModel {
  Treino._({
    this.id,
    required this.descricao,
    required this.objetivo,
    required this.pessoaId,
    this.pessoa,
    this.treinoExercicios,
    this.treinoHistoricos,
  });

  factory Treino({
    int? id,
    required String descricao,
    required String objetivo,
    required int pessoaId,
    _i2.Pessoa? pessoa,
    List<_i2.TreinoExercicio>? treinoExercicios,
    List<_i2.TreinoHistorico>? treinoHistoricos,
  }) = _TreinoImpl;

  factory Treino.fromJson(Map<String, dynamic> jsonSerialization) {
    return Treino(
      id: jsonSerialization['id'] as int?,
      descricao: jsonSerialization['descricao'] as String,
      objetivo: jsonSerialization['objetivo'] as String,
      pessoaId: jsonSerialization['pessoaId'] as int,
      pessoa: jsonSerialization['pessoa'] == null
          ? null
          : _i2.Pessoa.fromJson(
              (jsonSerialization['pessoa'] as Map<String, dynamic>)),
      treinoExercicios: (jsonSerialization['treinoExercicios'] as List?)
          ?.map(
              (e) => _i2.TreinoExercicio.fromJson((e as Map<String, dynamic>)))
          .toList(),
      treinoHistoricos: (jsonSerialization['treinoHistoricos'] as List?)
          ?.map(
              (e) => _i2.TreinoHistorico.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String descricao;

  String objetivo;

  int pessoaId;

  _i2.Pessoa? pessoa;

  List<_i2.TreinoExercicio>? treinoExercicios;

  List<_i2.TreinoHistorico>? treinoHistoricos;

  Treino copyWith({
    int? id,
    String? descricao,
    String? objetivo,
    int? pessoaId,
    _i2.Pessoa? pessoa,
    List<_i2.TreinoExercicio>? treinoExercicios,
    List<_i2.TreinoHistorico>? treinoHistoricos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'descricao': descricao,
      'objetivo': objetivo,
      'pessoaId': pessoaId,
      if (pessoa != null) 'pessoa': pessoa?.toJson(),
      if (treinoExercicios != null)
        'treinoExercicios':
            treinoExercicios?.toJson(valueToJson: (v) => v.toJson()),
      if (treinoHistoricos != null)
        'treinoHistoricos':
            treinoHistoricos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TreinoImpl extends Treino {
  _TreinoImpl({
    int? id,
    required String descricao,
    required String objetivo,
    required int pessoaId,
    _i2.Pessoa? pessoa,
    List<_i2.TreinoExercicio>? treinoExercicios,
    List<_i2.TreinoHistorico>? treinoHistoricos,
  }) : super._(
          id: id,
          descricao: descricao,
          objetivo: objetivo,
          pessoaId: pessoaId,
          pessoa: pessoa,
          treinoExercicios: treinoExercicios,
          treinoHistoricos: treinoHistoricos,
        );

  @override
  Treino copyWith({
    Object? id = _Undefined,
    String? descricao,
    String? objetivo,
    int? pessoaId,
    Object? pessoa = _Undefined,
    Object? treinoExercicios = _Undefined,
    Object? treinoHistoricos = _Undefined,
  }) {
    return Treino(
      id: id is int? ? id : this.id,
      descricao: descricao ?? this.descricao,
      objetivo: objetivo ?? this.objetivo,
      pessoaId: pessoaId ?? this.pessoaId,
      pessoa: pessoa is _i2.Pessoa? ? pessoa : this.pessoa?.copyWith(),
      treinoExercicios: treinoExercicios is List<_i2.TreinoExercicio>?
          ? treinoExercicios
          : this.treinoExercicios?.map((e0) => e0.copyWith()).toList(),
      treinoHistoricos: treinoHistoricos is List<_i2.TreinoHistorico>?
          ? treinoHistoricos
          : this.treinoHistoricos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

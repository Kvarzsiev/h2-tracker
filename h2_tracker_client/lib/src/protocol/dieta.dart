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

abstract class Dieta implements _i1.SerializableModel {
  Dieta._({
    this.id,
    required this.caloriasMaximasDia,
    required this.objetivo,
    required this.descricao,
    required this.dataFim,
    required this.pessoaId,
    this.refeicoes,
  });

  factory Dieta({
    int? id,
    required int caloriasMaximasDia,
    required String objetivo,
    required String descricao,
    required DateTime dataFim,
    required int pessoaId,
    List<_i2.Refeicao>? refeicoes,
  }) = _DietaImpl;

  factory Dieta.fromJson(Map<String, dynamic> jsonSerialization) {
    return Dieta(
      id: jsonSerialization['id'] as int?,
      caloriasMaximasDia: jsonSerialization['caloriasMaximasDia'] as int,
      objetivo: jsonSerialization['objetivo'] as String,
      descricao: jsonSerialization['descricao'] as String,
      dataFim: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dataFim']),
      pessoaId: jsonSerialization['pessoaId'] as int,
      refeicoes: (jsonSerialization['refeicoes'] as List?)
          ?.map((e) => _i2.Refeicao.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int caloriasMaximasDia;

  String objetivo;

  String descricao;

  DateTime dataFim;

  int pessoaId;

  List<_i2.Refeicao>? refeicoes;

  Dieta copyWith({
    int? id,
    int? caloriasMaximasDia,
    String? objetivo,
    String? descricao,
    DateTime? dataFim,
    int? pessoaId,
    List<_i2.Refeicao>? refeicoes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'caloriasMaximasDia': caloriasMaximasDia,
      'objetivo': objetivo,
      'descricao': descricao,
      'dataFim': dataFim.toJson(),
      'pessoaId': pessoaId,
      if (refeicoes != null)
        'refeicoes': refeicoes?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DietaImpl extends Dieta {
  _DietaImpl({
    int? id,
    required int caloriasMaximasDia,
    required String objetivo,
    required String descricao,
    required DateTime dataFim,
    required int pessoaId,
    List<_i2.Refeicao>? refeicoes,
  }) : super._(
          id: id,
          caloriasMaximasDia: caloriasMaximasDia,
          objetivo: objetivo,
          descricao: descricao,
          dataFim: dataFim,
          pessoaId: pessoaId,
          refeicoes: refeicoes,
        );

  @override
  Dieta copyWith({
    Object? id = _Undefined,
    int? caloriasMaximasDia,
    String? objetivo,
    String? descricao,
    DateTime? dataFim,
    int? pessoaId,
    Object? refeicoes = _Undefined,
  }) {
    return Dieta(
      id: id is int? ? id : this.id,
      caloriasMaximasDia: caloriasMaximasDia ?? this.caloriasMaximasDia,
      objetivo: objetivo ?? this.objetivo,
      descricao: descricao ?? this.descricao,
      dataFim: dataFim ?? this.dataFim,
      pessoaId: pessoaId ?? this.pessoaId,
      refeicoes: refeicoes is List<_i2.Refeicao>?
          ? refeicoes
          : this.refeicoes?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

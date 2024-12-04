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

abstract class TreinoHistorico implements _i1.SerializableModel {
  TreinoHistorico._({
    this.id,
    required this.horarioInicio,
    required this.horarioFim,
    required this.treinoId,
    this.treino,
    this.treinoHistoricoExercicios,
  });

  factory TreinoHistorico({
    int? id,
    required DateTime horarioInicio,
    required DateTime horarioFim,
    required int treinoId,
    _i2.Treino? treino,
    List<_i2.TreinoExercicioHistorico>? treinoHistoricoExercicios,
  }) = _TreinoHistoricoImpl;

  factory TreinoHistorico.fromJson(Map<String, dynamic> jsonSerialization) {
    return TreinoHistorico(
      id: jsonSerialization['id'] as int?,
      horarioInicio: _i1.DateTimeJsonExtension.fromJson(
          jsonSerialization['horarioInicio']),
      horarioFim:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['horarioFim']),
      treinoId: jsonSerialization['treinoId'] as int,
      treino: jsonSerialization['treino'] == null
          ? null
          : _i2.Treino.fromJson(
              (jsonSerialization['treino'] as Map<String, dynamic>)),
      treinoHistoricoExercicios:
          (jsonSerialization['treinoHistoricoExercicios'] as List?)
              ?.map((e) => _i2.TreinoExercicioHistorico.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  DateTime horarioInicio;

  DateTime horarioFim;

  int treinoId;

  _i2.Treino? treino;

  List<_i2.TreinoExercicioHistorico>? treinoHistoricoExercicios;

  TreinoHistorico copyWith({
    int? id,
    DateTime? horarioInicio,
    DateTime? horarioFim,
    int? treinoId,
    _i2.Treino? treino,
    List<_i2.TreinoExercicioHistorico>? treinoHistoricoExercicios,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'horarioInicio': horarioInicio.toJson(),
      'horarioFim': horarioFim.toJson(),
      'treinoId': treinoId,
      if (treino != null) 'treino': treino?.toJson(),
      if (treinoHistoricoExercicios != null)
        'treinoHistoricoExercicios':
            treinoHistoricoExercicios?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TreinoHistoricoImpl extends TreinoHistorico {
  _TreinoHistoricoImpl({
    int? id,
    required DateTime horarioInicio,
    required DateTime horarioFim,
    required int treinoId,
    _i2.Treino? treino,
    List<_i2.TreinoExercicioHistorico>? treinoHistoricoExercicios,
  }) : super._(
          id: id,
          horarioInicio: horarioInicio,
          horarioFim: horarioFim,
          treinoId: treinoId,
          treino: treino,
          treinoHistoricoExercicios: treinoHistoricoExercicios,
        );

  @override
  TreinoHistorico copyWith({
    Object? id = _Undefined,
    DateTime? horarioInicio,
    DateTime? horarioFim,
    int? treinoId,
    Object? treino = _Undefined,
    Object? treinoHistoricoExercicios = _Undefined,
  }) {
    return TreinoHistorico(
      id: id is int? ? id : this.id,
      horarioInicio: horarioInicio ?? this.horarioInicio,
      horarioFim: horarioFim ?? this.horarioFim,
      treinoId: treinoId ?? this.treinoId,
      treino: treino is _i2.Treino? ? treino : this.treino?.copyWith(),
      treinoHistoricoExercicios: treinoHistoricoExercicios
              is List<_i2.TreinoExercicioHistorico>?
          ? treinoHistoricoExercicios
          : this.treinoHistoricoExercicios?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

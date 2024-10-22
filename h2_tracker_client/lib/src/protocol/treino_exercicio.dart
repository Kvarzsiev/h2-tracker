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

abstract class TreinoExercicio implements _i1.SerializableModel {
  TreinoExercicio._({
    this.id,
    required this.repeticoes,
    required this.series,
    required this.treinoId,
    this.treino,
    required this.exercicioId,
    this.exercicio,
    this.treinoExercicioHistoricos,
  });

  factory TreinoExercicio({
    int? id,
    required int repeticoes,
    required int series,
    required int treinoId,
    _i2.Treino? treino,
    required int exercicioId,
    _i2.Exercicio? exercicio,
    List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos,
  }) = _TreinoExercicioImpl;

  factory TreinoExercicio.fromJson(Map<String, dynamic> jsonSerialization) {
    return TreinoExercicio(
      id: jsonSerialization['id'] as int?,
      repeticoes: jsonSerialization['repeticoes'] as int,
      series: jsonSerialization['series'] as int,
      treinoId: jsonSerialization['treinoId'] as int,
      treino: jsonSerialization['treino'] == null
          ? null
          : _i2.Treino.fromJson(
              (jsonSerialization['treino'] as Map<String, dynamic>)),
      exercicioId: jsonSerialization['exercicioId'] as int,
      exercicio: jsonSerialization['exercicio'] == null
          ? null
          : _i2.Exercicio.fromJson(
              (jsonSerialization['exercicio'] as Map<String, dynamic>)),
      treinoExercicioHistoricos:
          (jsonSerialization['treinoExercicioHistoricos'] as List?)
              ?.map((e) => _i2.TreinoExercicioHistorico.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int repeticoes;

  int series;

  int treinoId;

  _i2.Treino? treino;

  int exercicioId;

  _i2.Exercicio? exercicio;

  List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos;

  TreinoExercicio copyWith({
    int? id,
    int? repeticoes,
    int? series,
    int? treinoId,
    _i2.Treino? treino,
    int? exercicioId,
    _i2.Exercicio? exercicio,
    List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'repeticoes': repeticoes,
      'series': series,
      'treinoId': treinoId,
      if (treino != null) 'treino': treino?.toJson(),
      'exercicioId': exercicioId,
      if (exercicio != null) 'exercicio': exercicio?.toJson(),
      if (treinoExercicioHistoricos != null)
        'treinoExercicioHistoricos':
            treinoExercicioHistoricos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TreinoExercicioImpl extends TreinoExercicio {
  _TreinoExercicioImpl({
    int? id,
    required int repeticoes,
    required int series,
    required int treinoId,
    _i2.Treino? treino,
    required int exercicioId,
    _i2.Exercicio? exercicio,
    List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos,
  }) : super._(
          id: id,
          repeticoes: repeticoes,
          series: series,
          treinoId: treinoId,
          treino: treino,
          exercicioId: exercicioId,
          exercicio: exercicio,
          treinoExercicioHistoricos: treinoExercicioHistoricos,
        );

  @override
  TreinoExercicio copyWith({
    Object? id = _Undefined,
    int? repeticoes,
    int? series,
    int? treinoId,
    Object? treino = _Undefined,
    int? exercicioId,
    Object? exercicio = _Undefined,
    Object? treinoExercicioHistoricos = _Undefined,
  }) {
    return TreinoExercicio(
      id: id is int? ? id : this.id,
      repeticoes: repeticoes ?? this.repeticoes,
      series: series ?? this.series,
      treinoId: treinoId ?? this.treinoId,
      treino: treino is _i2.Treino? ? treino : this.treino?.copyWith(),
      exercicioId: exercicioId ?? this.exercicioId,
      exercicio:
          exercicio is _i2.Exercicio? ? exercicio : this.exercicio?.copyWith(),
      treinoExercicioHistoricos: treinoExercicioHistoricos
              is List<_i2.TreinoExercicioHistorico>?
          ? treinoExercicioHistoricos
          : this.treinoExercicioHistoricos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

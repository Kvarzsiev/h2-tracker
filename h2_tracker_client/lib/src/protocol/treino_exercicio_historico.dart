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

abstract class TreinoExercicioHistorico implements _i1.SerializableModel {
  TreinoExercicioHistorico._({
    this.id,
    required this.progressao,
    required this.treinoExercicioId,
    this.treinoExercicio,
  });

  factory TreinoExercicioHistorico({
    int? id,
    required String progressao,
    required int treinoExercicioId,
    _i2.TreinoExercicio? treinoExercicio,
  }) = _TreinoExercicioHistoricoImpl;

  factory TreinoExercicioHistorico.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return TreinoExercicioHistorico(
      id: jsonSerialization['id'] as int?,
      progressao: jsonSerialization['progressao'] as String,
      treinoExercicioId: jsonSerialization['treinoExercicioId'] as int,
      treinoExercicio: jsonSerialization['treinoExercicio'] == null
          ? null
          : _i2.TreinoExercicio.fromJson(
              (jsonSerialization['treinoExercicio'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  /// Kg, ângulo, duração, tal e tal
  String progressao;

  int treinoExercicioId;

  _i2.TreinoExercicio? treinoExercicio;

  TreinoExercicioHistorico copyWith({
    int? id,
    String? progressao,
    int? treinoExercicioId,
    _i2.TreinoExercicio? treinoExercicio,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'progressao': progressao,
      'treinoExercicioId': treinoExercicioId,
      if (treinoExercicio != null) 'treinoExercicio': treinoExercicio?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TreinoExercicioHistoricoImpl extends TreinoExercicioHistorico {
  _TreinoExercicioHistoricoImpl({
    int? id,
    required String progressao,
    required int treinoExercicioId,
    _i2.TreinoExercicio? treinoExercicio,
  }) : super._(
          id: id,
          progressao: progressao,
          treinoExercicioId: treinoExercicioId,
          treinoExercicio: treinoExercicio,
        );

  @override
  TreinoExercicioHistorico copyWith({
    Object? id = _Undefined,
    String? progressao,
    int? treinoExercicioId,
    Object? treinoExercicio = _Undefined,
  }) {
    return TreinoExercicioHistorico(
      id: id is int? ? id : this.id,
      progressao: progressao ?? this.progressao,
      treinoExercicioId: treinoExercicioId ?? this.treinoExercicioId,
      treinoExercicio: treinoExercicio is _i2.TreinoExercicio?
          ? treinoExercicio
          : this.treinoExercicio?.copyWith(),
    );
  }
}

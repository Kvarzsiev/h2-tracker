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

abstract class Refeicao implements _i1.SerializableModel {
  Refeicao._({
    this.id,
    required this.calorias,
    required this.proteinas,
    required this.descricao,
    required this.dietaId,
    this.dieta,
  });

  factory Refeicao({
    int? id,
    required int calorias,
    required int proteinas,
    required String descricao,
    required int dietaId,
    _i2.Dieta? dieta,
  }) = _RefeicaoImpl;

  factory Refeicao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Refeicao(
      id: jsonSerialization['id'] as int?,
      calorias: jsonSerialization['calorias'] as int,
      proteinas: jsonSerialization['proteinas'] as int,
      descricao: jsonSerialization['descricao'] as String,
      dietaId: jsonSerialization['dietaId'] as int,
      dieta: jsonSerialization['dieta'] == null
          ? null
          : _i2.Dieta.fromJson(
              (jsonSerialization['dieta'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int calorias;

  int proteinas;

  String descricao;

  int dietaId;

  _i2.Dieta? dieta;

  Refeicao copyWith({
    int? id,
    int? calorias,
    int? proteinas,
    String? descricao,
    int? dietaId,
    _i2.Dieta? dieta,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'calorias': calorias,
      'proteinas': proteinas,
      'descricao': descricao,
      'dietaId': dietaId,
      if (dieta != null) 'dieta': dieta?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _RefeicaoImpl extends Refeicao {
  _RefeicaoImpl({
    int? id,
    required int calorias,
    required int proteinas,
    required String descricao,
    required int dietaId,
    _i2.Dieta? dieta,
  }) : super._(
          id: id,
          calorias: calorias,
          proteinas: proteinas,
          descricao: descricao,
          dietaId: dietaId,
          dieta: dieta,
        );

  @override
  Refeicao copyWith({
    Object? id = _Undefined,
    int? calorias,
    int? proteinas,
    String? descricao,
    int? dietaId,
    Object? dieta = _Undefined,
  }) {
    return Refeicao(
      id: id is int? ? id : this.id,
      calorias: calorias ?? this.calorias,
      proteinas: proteinas ?? this.proteinas,
      descricao: descricao ?? this.descricao,
      dietaId: dietaId ?? this.dietaId,
      dieta: dieta is _i2.Dieta? ? dieta : this.dieta?.copyWith(),
    );
  }
}

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

abstract class Alimento implements _i1.SerializableModel {
  Alimento._({
    this.id,
    required this.tipo,
    required this.caloriasGrama,
    required this.proteinasGrama,
    required this.descricao,
    this.opcoesAlimentos,
  });

  factory Alimento({
    int? id,
    required String tipo,
    required int caloriasGrama,
    required int proteinasGrama,
    required String descricao,
    List<_i2.OpcaoAlimento>? opcoesAlimentos,
  }) = _AlimentoImpl;

  factory Alimento.fromJson(Map<String, dynamic> jsonSerialization) {
    return Alimento(
      id: jsonSerialization['id'] as int?,
      tipo: jsonSerialization['tipo'] as String,
      caloriasGrama: jsonSerialization['caloriasGrama'] as int,
      proteinasGrama: jsonSerialization['proteinasGrama'] as int,
      descricao: jsonSerialization['descricao'] as String,
      opcoesAlimentos: (jsonSerialization['opcoesAlimentos'] as List?)
          ?.map((e) => _i2.OpcaoAlimento.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String tipo;

  int caloriasGrama;

  int proteinasGrama;

  String descricao;

  List<_i2.OpcaoAlimento>? opcoesAlimentos;

  Alimento copyWith({
    int? id,
    String? tipo,
    int? caloriasGrama,
    int? proteinasGrama,
    String? descricao,
    List<_i2.OpcaoAlimento>? opcoesAlimentos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'tipo': tipo,
      'caloriasGrama': caloriasGrama,
      'proteinasGrama': proteinasGrama,
      'descricao': descricao,
      if (opcoesAlimentos != null)
        'opcoesAlimentos':
            opcoesAlimentos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _AlimentoImpl extends Alimento {
  _AlimentoImpl({
    int? id,
    required String tipo,
    required int caloriasGrama,
    required int proteinasGrama,
    required String descricao,
    List<_i2.OpcaoAlimento>? opcoesAlimentos,
  }) : super._(
          id: id,
          tipo: tipo,
          caloriasGrama: caloriasGrama,
          proteinasGrama: proteinasGrama,
          descricao: descricao,
          opcoesAlimentos: opcoesAlimentos,
        );

  @override
  Alimento copyWith({
    Object? id = _Undefined,
    String? tipo,
    int? caloriasGrama,
    int? proteinasGrama,
    String? descricao,
    Object? opcoesAlimentos = _Undefined,
  }) {
    return Alimento(
      id: id is int? ? id : this.id,
      tipo: tipo ?? this.tipo,
      caloriasGrama: caloriasGrama ?? this.caloriasGrama,
      proteinasGrama: proteinasGrama ?? this.proteinasGrama,
      descricao: descricao ?? this.descricao,
      opcoesAlimentos: opcoesAlimentos is List<_i2.OpcaoAlimento>?
          ? opcoesAlimentos
          : this.opcoesAlimentos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

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

abstract class Exercicio implements _i1.SerializableModel {
  Exercicio._({
    this.id,
    required this.nome,
    required this.grupoMuscular,
    required this.descricao,
    required this.imagem,
    this.treinoExercicios,
  });

  factory Exercicio({
    int? id,
    required String nome,
    required String grupoMuscular,
    required String descricao,
    required String imagem,
    List<_i2.TreinoExercicio>? treinoExercicios,
  }) = _ExercicioImpl;

  factory Exercicio.fromJson(Map<String, dynamic> jsonSerialization) {
    return Exercicio(
      id: jsonSerialization['id'] as int?,
      nome: jsonSerialization['nome'] as String,
      grupoMuscular: jsonSerialization['grupoMuscular'] as String,
      descricao: jsonSerialization['descricao'] as String,
      imagem: jsonSerialization['imagem'] as String,
      treinoExercicios: (jsonSerialization['treinoExercicios'] as List?)
          ?.map(
              (e) => _i2.TreinoExercicio.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String nome;

  String grupoMuscular;

  String descricao;

  String imagem;

  List<_i2.TreinoExercicio>? treinoExercicios;

  Exercicio copyWith({
    int? id,
    String? nome,
    String? grupoMuscular,
    String? descricao,
    String? imagem,
    List<_i2.TreinoExercicio>? treinoExercicios,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'grupoMuscular': grupoMuscular,
      'descricao': descricao,
      'imagem': imagem,
      if (treinoExercicios != null)
        'treinoExercicios':
            treinoExercicios?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExercicioImpl extends Exercicio {
  _ExercicioImpl({
    int? id,
    required String nome,
    required String grupoMuscular,
    required String descricao,
    required String imagem,
    List<_i2.TreinoExercicio>? treinoExercicios,
  }) : super._(
          id: id,
          nome: nome,
          grupoMuscular: grupoMuscular,
          descricao: descricao,
          imagem: imagem,
          treinoExercicios: treinoExercicios,
        );

  @override
  Exercicio copyWith({
    Object? id = _Undefined,
    String? nome,
    String? grupoMuscular,
    String? descricao,
    String? imagem,
    Object? treinoExercicios = _Undefined,
  }) {
    return Exercicio(
      id: id is int? ? id : this.id,
      nome: nome ?? this.nome,
      grupoMuscular: grupoMuscular ?? this.grupoMuscular,
      descricao: descricao ?? this.descricao,
      imagem: imagem ?? this.imagem,
      treinoExercicios: treinoExercicios is List<_i2.TreinoExercicio>?
          ? treinoExercicios
          : this.treinoExercicios?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

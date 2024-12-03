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

abstract class Pessoa implements _i1.SerializableModel {
  Pessoa._({
    this.id,
    required this.nome,
    required this.altura,
    required this.idade,
    required this.email,
    required this.senha,
    required this.cpf,
    required this.sex,
    this.historicoPeso,
    this.historicoDietas,
    this.treinos,
  });

  factory Pessoa({
    int? id,
    required String nome,
    required double altura,
    required int idade,
    required String email,
    required String senha,
    required String cpf,
    required String sex,
    List<_i2.Peso>? historicoPeso,
    List<_i2.Dieta>? historicoDietas,
    List<_i2.Treino>? treinos,
  }) = _PessoaImpl;

  factory Pessoa.fromJson(Map<String, dynamic> jsonSerialization) {
    return Pessoa(
      id: jsonSerialization['id'] as int?,
      nome: jsonSerialization['nome'] as String,
      altura: (jsonSerialization['altura'] as num).toDouble(),
      idade: jsonSerialization['idade'] as int,
      email: jsonSerialization['email'] as String,
      senha: jsonSerialization['senha'] as String,
      cpf: jsonSerialization['cpf'] as String,
      sex: jsonSerialization['sex'] as String,
      historicoPeso: (jsonSerialization['historicoPeso'] as List?)
          ?.map((e) => _i2.Peso.fromJson((e as Map<String, dynamic>)))
          .toList(),
      historicoDietas: (jsonSerialization['historicoDietas'] as List?)
          ?.map((e) => _i2.Dieta.fromJson((e as Map<String, dynamic>)))
          .toList(),
      treinos: (jsonSerialization['treinos'] as List?)
          ?.map((e) => _i2.Treino.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String nome;

  double altura;

  int idade;

  String email;

  String senha;

  String cpf;

  String sex;

  List<_i2.Peso>? historicoPeso;

  List<_i2.Dieta>? historicoDietas;

  List<_i2.Treino>? treinos;

  Pessoa copyWith({
    int? id,
    String? nome,
    double? altura,
    int? idade,
    String? email,
    String? senha,
    String? cpf,
    String? sex,
    List<_i2.Peso>? historicoPeso,
    List<_i2.Dieta>? historicoDietas,
    List<_i2.Treino>? treinos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'altura': altura,
      'idade': idade,
      'email': email,
      'senha': senha,
      'cpf': cpf,
      'sex': sex,
      if (historicoPeso != null)
        'historicoPeso': historicoPeso?.toJson(valueToJson: (v) => v.toJson()),
      if (historicoDietas != null)
        'historicoDietas':
            historicoDietas?.toJson(valueToJson: (v) => v.toJson()),
      if (treinos != null)
        'treinos': treinos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PessoaImpl extends Pessoa {
  _PessoaImpl({
    int? id,
    required String nome,
    required double altura,
    required int idade,
    required String email,
    required String senha,
    required String cpf,
    required String sex,
    List<_i2.Peso>? historicoPeso,
    List<_i2.Dieta>? historicoDietas,
    List<_i2.Treino>? treinos,
  }) : super._(
          id: id,
          nome: nome,
          altura: altura,
          idade: idade,
          email: email,
          senha: senha,
          cpf: cpf,
          sex: sex,
          historicoPeso: historicoPeso,
          historicoDietas: historicoDietas,
          treinos: treinos,
        );

  @override
  Pessoa copyWith({
    Object? id = _Undefined,
    String? nome,
    double? altura,
    int? idade,
    String? email,
    String? senha,
    String? cpf,
    String? sex,
    Object? historicoPeso = _Undefined,
    Object? historicoDietas = _Undefined,
    Object? treinos = _Undefined,
  }) {
    return Pessoa(
      id: id is int? ? id : this.id,
      nome: nome ?? this.nome,
      altura: altura ?? this.altura,
      idade: idade ?? this.idade,
      email: email ?? this.email,
      senha: senha ?? this.senha,
      cpf: cpf ?? this.cpf,
      sex: sex ?? this.sex,
      historicoPeso: historicoPeso is List<_i2.Peso>?
          ? historicoPeso
          : this.historicoPeso?.map((e0) => e0.copyWith()).toList(),
      historicoDietas: historicoDietas is List<_i2.Dieta>?
          ? historicoDietas
          : this.historicoDietas?.map((e0) => e0.copyWith()).toList(),
      treinos: treinos is List<_i2.Treino>?
          ? treinos
          : this.treinos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

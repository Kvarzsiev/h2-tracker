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

abstract class Peso implements _i1.SerializableModel {
  Peso._({
    this.id,
    required this.peso,
    required this.imc,
    required this.dataPesagem,
    required this.pessoaId,
  });

  factory Peso({
    int? id,
    required double peso,
    required double imc,
    required DateTime dataPesagem,
    required int pessoaId,
  }) = _PesoImpl;

  factory Peso.fromJson(Map<String, dynamic> jsonSerialization) {
    return Peso(
      id: jsonSerialization['id'] as int?,
      peso: (jsonSerialization['peso'] as num).toDouble(),
      imc: (jsonSerialization['imc'] as num).toDouble(),
      dataPesagem:
          _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dataPesagem']),
      pessoaId: jsonSerialization['pessoaId'] as int,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  double peso;

  double imc;

  DateTime dataPesagem;

  int pessoaId;

  Peso copyWith({
    int? id,
    double? peso,
    double? imc,
    DateTime? dataPesagem,
    int? pessoaId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'peso': peso,
      'imc': imc,
      'dataPesagem': dataPesagem.toJson(),
      'pessoaId': pessoaId,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _PesoImpl extends Peso {
  _PesoImpl({
    int? id,
    required double peso,
    required double imc,
    required DateTime dataPesagem,
    required int pessoaId,
  }) : super._(
          id: id,
          peso: peso,
          imc: imc,
          dataPesagem: dataPesagem,
          pessoaId: pessoaId,
        );

  @override
  Peso copyWith({
    Object? id = _Undefined,
    double? peso,
    double? imc,
    DateTime? dataPesagem,
    int? pessoaId,
  }) {
    return Peso(
      id: id is int? ? id : this.id,
      peso: peso ?? this.peso,
      imc: imc ?? this.imc,
      dataPesagem: dataPesagem ?? this.dataPesagem,
      pessoaId: pessoaId ?? this.pessoaId,
    );
  }
}

/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: invalid_use_of_visible_for_testing_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Peso implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = PesoTable();

  static const db = PesoRepository._();

  @override
  int? id;

  double peso;

  double imc;

  DateTime dataPesagem;

  int pessoaId;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'peso': peso,
      'imc': imc,
      'dataPesagem': dataPesagem.toJson(),
      'pessoaId': pessoaId,
    };
  }

  static PesoInclude include() {
    return PesoInclude._();
  }

  static PesoIncludeList includeList({
    _i1.WhereExpressionBuilder<PesoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PesoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PesoTable>? orderByList,
    PesoInclude? include,
  }) {
    return PesoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Peso.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Peso.t),
      include: include,
    );
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

class PesoTable extends _i1.Table {
  PesoTable({super.tableRelation}) : super(tableName: 'peso') {
    peso = _i1.ColumnDouble(
      'peso',
      this,
    );
    imc = _i1.ColumnDouble(
      'imc',
      this,
    );
    dataPesagem = _i1.ColumnDateTime(
      'dataPesagem',
      this,
    );
    pessoaId = _i1.ColumnInt(
      'pessoaId',
      this,
    );
  }

  late final _i1.ColumnDouble peso;

  late final _i1.ColumnDouble imc;

  late final _i1.ColumnDateTime dataPesagem;

  late final _i1.ColumnInt pessoaId;

  @override
  List<_i1.Column> get columns => [
        id,
        peso,
        imc,
        dataPesagem,
        pessoaId,
      ];
}

class PesoInclude extends _i1.IncludeObject {
  PesoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Peso.t;
}

class PesoIncludeList extends _i1.IncludeList {
  PesoIncludeList._({
    _i1.WhereExpressionBuilder<PesoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Peso.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Peso.t;
}

class PesoRepository {
  const PesoRepository._();

  Future<List<Peso>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PesoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PesoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PesoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Peso>(
      where: where?.call(Peso.t),
      orderBy: orderBy?.call(Peso.t),
      orderByList: orderByList?.call(Peso.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Peso?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PesoTable>? where,
    int? offset,
    _i1.OrderByBuilder<PesoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PesoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<Peso>(
      where: where?.call(Peso.t),
      orderBy: orderBy?.call(Peso.t),
      orderByList: orderByList?.call(Peso.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Peso?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<Peso>(
      id,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Peso>> insert(
    _i1.Session session,
    List<Peso> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Peso>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Peso> insertRow(
    _i1.Session session,
    Peso row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Peso>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Peso>> update(
    _i1.Session session,
    List<Peso> rows, {
    _i1.ColumnSelections<PesoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Peso>(
      rows,
      columns: columns?.call(Peso.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Peso> updateRow(
    _i1.Session session,
    Peso row, {
    _i1.ColumnSelections<PesoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Peso>(
      row,
      columns: columns?.call(Peso.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Peso>> delete(
    _i1.Session session,
    List<Peso> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Peso>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Peso> deleteRow(
    _i1.Session session,
    Peso row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Peso>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Peso>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PesoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Peso>(
      where: where(Peso.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PesoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Peso>(
      where: where?.call(Peso.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

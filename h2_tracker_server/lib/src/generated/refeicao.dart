/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class Refeicao implements _i1.TableRow, _i1.ProtocolSerialization {
  Refeicao._({
    this.id,
    required this.calorias,
    required this.proteinas,
    required this.descricao,
    required this.dietaId,
  });

  factory Refeicao({
    int? id,
    required int calorias,
    required int proteinas,
    required String descricao,
    required int dietaId,
  }) = _RefeicaoImpl;

  factory Refeicao.fromJson(Map<String, dynamic> jsonSerialization) {
    return Refeicao(
      id: jsonSerialization['id'] as int?,
      calorias: jsonSerialization['calorias'] as int,
      proteinas: jsonSerialization['proteinas'] as int,
      descricao: jsonSerialization['descricao'] as String,
      dietaId: jsonSerialization['dietaId'] as int,
    );
  }

  static final t = RefeicaoTable();

  static const db = RefeicaoRepository._();

  @override
  int? id;

  int calorias;

  int proteinas;

  String descricao;

  int dietaId;

  @override
  _i1.Table get table => t;

  Refeicao copyWith({
    int? id,
    int? calorias,
    int? proteinas,
    String? descricao,
    int? dietaId,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'calorias': calorias,
      'proteinas': proteinas,
      'descricao': descricao,
      'dietaId': dietaId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'calorias': calorias,
      'proteinas': proteinas,
      'descricao': descricao,
      'dietaId': dietaId,
    };
  }

  static RefeicaoInclude include() {
    return RefeicaoInclude._();
  }

  static RefeicaoIncludeList includeList({
    _i1.WhereExpressionBuilder<RefeicaoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RefeicaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefeicaoTable>? orderByList,
    RefeicaoInclude? include,
  }) {
    return RefeicaoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Refeicao.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Refeicao.t),
      include: include,
    );
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
  }) : super._(
          id: id,
          calorias: calorias,
          proteinas: proteinas,
          descricao: descricao,
          dietaId: dietaId,
        );

  @override
  Refeicao copyWith({
    Object? id = _Undefined,
    int? calorias,
    int? proteinas,
    String? descricao,
    int? dietaId,
  }) {
    return Refeicao(
      id: id is int? ? id : this.id,
      calorias: calorias ?? this.calorias,
      proteinas: proteinas ?? this.proteinas,
      descricao: descricao ?? this.descricao,
      dietaId: dietaId ?? this.dietaId,
    );
  }
}

class RefeicaoTable extends _i1.Table {
  RefeicaoTable({super.tableRelation}) : super(tableName: 'refeicao') {
    calorias = _i1.ColumnInt(
      'calorias',
      this,
    );
    proteinas = _i1.ColumnInt(
      'proteinas',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    dietaId = _i1.ColumnInt(
      'dietaId',
      this,
    );
  }

  late final _i1.ColumnInt calorias;

  late final _i1.ColumnInt proteinas;

  late final _i1.ColumnString descricao;

  late final _i1.ColumnInt dietaId;

  @override
  List<_i1.Column> get columns => [
        id,
        calorias,
        proteinas,
        descricao,
        dietaId,
      ];
}

class RefeicaoInclude extends _i1.IncludeObject {
  RefeicaoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table get table => Refeicao.t;
}

class RefeicaoIncludeList extends _i1.IncludeList {
  RefeicaoIncludeList._({
    _i1.WhereExpressionBuilder<RefeicaoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Refeicao.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Refeicao.t;
}

class RefeicaoRepository {
  const RefeicaoRepository._();

  Future<List<Refeicao>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<RefeicaoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<RefeicaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefeicaoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.find<Refeicao>(
      where: where?.call(Refeicao.t),
      orderBy: orderBy?.call(Refeicao.t),
      orderByList: orderByList?.call(Refeicao.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Refeicao?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<RefeicaoTable>? where,
    int? offset,
    _i1.OrderByBuilder<RefeicaoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<RefeicaoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findFirstRow<Refeicao>(
      where: where?.call(Refeicao.t),
      orderBy: orderBy?.call(Refeicao.t),
      orderByList: orderByList?.call(Refeicao.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Refeicao?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.findById<Refeicao>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Refeicao>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Refeicao> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Refeicao>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Refeicao> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Refeicao row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Refeicao>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Refeicao>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Refeicao> rows, {
    _i1.ColumnSelections<RefeicaoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Refeicao>(
      rows,
      columns: columns?.call(Refeicao.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Refeicao> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Refeicao row, {
    _i1.ColumnSelections<RefeicaoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Refeicao>(
      row,
      columns: columns?.call(Refeicao.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Refeicao>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Refeicao> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Refeicao>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Refeicao> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Refeicao row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Refeicao>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Refeicao>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<RefeicaoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Refeicao>(
      where: where(Refeicao.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<RefeicaoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Refeicao>(
      where: where?.call(Refeicao.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

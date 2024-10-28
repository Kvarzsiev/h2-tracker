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
import 'protocol.dart' as _i2;

abstract class TreinoHistorico
    implements _i1.TableRow, _i1.ProtocolSerialization {
  TreinoHistorico._({
    this.id,
    required this.horarioInicio,
    required this.horarioFim,
    required this.treinoId,
    this.treino,
  });

  factory TreinoHistorico({
    int? id,
    required DateTime horarioInicio,
    required DateTime horarioFim,
    required int treinoId,
    _i2.Treino? treino,
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
    );
  }

  static final t = TreinoHistoricoTable();

  static const db = TreinoHistoricoRepository._();

  @override
  int? id;

  DateTime horarioInicio;

  DateTime horarioFim;

  int treinoId;

  _i2.Treino? treino;

  @override
  _i1.Table get table => t;

  TreinoHistorico copyWith({
    int? id,
    DateTime? horarioInicio,
    DateTime? horarioFim,
    int? treinoId,
    _i2.Treino? treino,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'horarioInicio': horarioInicio.toJson(),
      'horarioFim': horarioFim.toJson(),
      'treinoId': treinoId,
      if (treino != null) 'treino': treino?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'horarioInicio': horarioInicio.toJson(),
      'horarioFim': horarioFim.toJson(),
      'treinoId': treinoId,
      if (treino != null) 'treino': treino?.toJsonForProtocol(),
    };
  }

  static TreinoHistoricoInclude include({_i2.TreinoInclude? treino}) {
    return TreinoHistoricoInclude._(treino: treino);
  }

  static TreinoHistoricoIncludeList includeList({
    _i1.WhereExpressionBuilder<TreinoHistoricoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TreinoHistoricoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoHistoricoTable>? orderByList,
    TreinoHistoricoInclude? include,
  }) {
    return TreinoHistoricoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TreinoHistorico.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TreinoHistorico.t),
      include: include,
    );
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
  }) : super._(
          id: id,
          horarioInicio: horarioInicio,
          horarioFim: horarioFim,
          treinoId: treinoId,
          treino: treino,
        );

  @override
  TreinoHistorico copyWith({
    Object? id = _Undefined,
    DateTime? horarioInicio,
    DateTime? horarioFim,
    int? treinoId,
    Object? treino = _Undefined,
  }) {
    return TreinoHistorico(
      id: id is int? ? id : this.id,
      horarioInicio: horarioInicio ?? this.horarioInicio,
      horarioFim: horarioFim ?? this.horarioFim,
      treinoId: treinoId ?? this.treinoId,
      treino: treino is _i2.Treino? ? treino : this.treino?.copyWith(),
    );
  }
}

class TreinoHistoricoTable extends _i1.Table {
  TreinoHistoricoTable({super.tableRelation})
      : super(tableName: 'treino_historico') {
    horarioInicio = _i1.ColumnDateTime(
      'horarioInicio',
      this,
    );
    horarioFim = _i1.ColumnDateTime(
      'horarioFim',
      this,
    );
    treinoId = _i1.ColumnInt(
      'treinoId',
      this,
    );
  }

  late final _i1.ColumnDateTime horarioInicio;

  late final _i1.ColumnDateTime horarioFim;

  late final _i1.ColumnInt treinoId;

  _i2.TreinoTable? _treino;

  _i2.TreinoTable get treino {
    if (_treino != null) return _treino!;
    _treino = _i1.createRelationTable(
      relationFieldName: 'treino',
      field: TreinoHistorico.t.treinoId,
      foreignField: _i2.Treino.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoTable(tableRelation: foreignTableRelation),
    );
    return _treino!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        horarioInicio,
        horarioFim,
        treinoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'treino') {
      return treino;
    }
    return null;
  }
}

class TreinoHistoricoInclude extends _i1.IncludeObject {
  TreinoHistoricoInclude._({_i2.TreinoInclude? treino}) {
    _treino = treino;
  }

  _i2.TreinoInclude? _treino;

  @override
  Map<String, _i1.Include?> get includes => {'treino': _treino};

  @override
  _i1.Table get table => TreinoHistorico.t;
}

class TreinoHistoricoIncludeList extends _i1.IncludeList {
  TreinoHistoricoIncludeList._({
    _i1.WhereExpressionBuilder<TreinoHistoricoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TreinoHistorico.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TreinoHistorico.t;
}

class TreinoHistoricoRepository {
  const TreinoHistoricoRepository._();

  final attachRow = const TreinoHistoricoAttachRowRepository._();

  Future<List<TreinoHistorico>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TreinoHistoricoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TreinoHistoricoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoHistoricoTable>? orderByList,
    _i1.Transaction? transaction,
    TreinoHistoricoInclude? include,
  }) async {
    return session.db.find<TreinoHistorico>(
      where: where?.call(TreinoHistorico.t),
      orderBy: orderBy?.call(TreinoHistorico.t),
      orderByList: orderByList?.call(TreinoHistorico.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<TreinoHistorico?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TreinoHistoricoTable>? where,
    int? offset,
    _i1.OrderByBuilder<TreinoHistoricoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoHistoricoTable>? orderByList,
    _i1.Transaction? transaction,
    TreinoHistoricoInclude? include,
  }) async {
    return session.db.findFirstRow<TreinoHistorico>(
      where: where?.call(TreinoHistorico.t),
      orderBy: orderBy?.call(TreinoHistorico.t),
      orderByList: orderByList?.call(TreinoHistorico.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<TreinoHistorico?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TreinoHistoricoInclude? include,
  }) async {
    return session.db.findById<TreinoHistorico>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<TreinoHistorico>> insert(
    _i1.Session session,
    List<TreinoHistorico> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<TreinoHistorico>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<TreinoHistorico> insertRow(
    _i1.Session session,
    TreinoHistorico row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<TreinoHistorico>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<TreinoHistorico>> update(
    _i1.Session session,
    List<TreinoHistorico> rows, {
    _i1.ColumnSelections<TreinoHistoricoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<TreinoHistorico>(
      rows,
      columns: columns?.call(TreinoHistorico.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<TreinoHistorico> updateRow(
    _i1.Session session,
    TreinoHistorico row, {
    _i1.ColumnSelections<TreinoHistoricoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<TreinoHistorico>(
      row,
      columns: columns?.call(TreinoHistorico.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<TreinoHistorico>> delete(
    _i1.Session session,
    List<TreinoHistorico> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<TreinoHistorico>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<TreinoHistorico> deleteRow(
    _i1.Session session,
    TreinoHistorico row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<TreinoHistorico>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<TreinoHistorico>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TreinoHistoricoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<TreinoHistorico>(
      where: where(TreinoHistorico.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TreinoHistoricoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<TreinoHistorico>(
      where: where?.call(TreinoHistorico.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class TreinoHistoricoAttachRowRepository {
  const TreinoHistoricoAttachRowRepository._();

  Future<void> treino(
    _i1.Session session,
    TreinoHistorico treinoHistorico,
    _i2.Treino treino, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoHistorico.id == null) {
      throw ArgumentError.notNull('treinoHistorico.id');
    }
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treinoHistorico = treinoHistorico.copyWith(treinoId: treino.id);
    await session.db.updateRow<TreinoHistorico>(
      $treinoHistorico,
      columns: [TreinoHistorico.t.treinoId],
      transaction: transaction ?? session.transaction,
    );
  }
}

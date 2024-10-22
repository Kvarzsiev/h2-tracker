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
import 'protocol.dart' as _i2;

abstract class Treino extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  Treino._({
    int? id,
    required this.descricao,
    required this.objetivo,
    this.treinoExercicios,
    this.treinoHistoricos,
  }) : super(id);

  factory Treino({
    int? id,
    required String descricao,
    required String objetivo,
    List<_i2.TreinoExercicio>? treinoExercicios,
    List<_i2.TreinoHistorico>? treinoHistoricos,
  }) = _TreinoImpl;

  factory Treino.fromJson(Map<String, dynamic> jsonSerialization) {
    return Treino(
      id: jsonSerialization['id'] as int?,
      descricao: jsonSerialization['descricao'] as String,
      objetivo: jsonSerialization['objetivo'] as String,
      treinoExercicios: (jsonSerialization['treinoExercicios'] as List?)
          ?.map(
              (e) => _i2.TreinoExercicio.fromJson((e as Map<String, dynamic>)))
          .toList(),
      treinoHistoricos: (jsonSerialization['treinoHistoricos'] as List?)
          ?.map(
              (e) => _i2.TreinoHistorico.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = TreinoTable();

  static const db = TreinoRepository._();

  String descricao;

  String objetivo;

  List<_i2.TreinoExercicio>? treinoExercicios;

  List<_i2.TreinoHistorico>? treinoHistoricos;

  @override
  _i1.Table get table => t;

  Treino copyWith({
    int? id,
    String? descricao,
    String? objetivo,
    List<_i2.TreinoExercicio>? treinoExercicios,
    List<_i2.TreinoHistorico>? treinoHistoricos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'descricao': descricao,
      'objetivo': objetivo,
      if (treinoExercicios != null)
        'treinoExercicios':
            treinoExercicios?.toJson(valueToJson: (v) => v.toJson()),
      if (treinoHistoricos != null)
        'treinoHistoricos':
            treinoHistoricos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'descricao': descricao,
      'objetivo': objetivo,
      if (treinoExercicios != null)
        'treinoExercicios':
            treinoExercicios?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (treinoHistoricos != null)
        'treinoHistoricos':
            treinoHistoricos?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static TreinoInclude include({
    _i2.TreinoExercicioIncludeList? treinoExercicios,
    _i2.TreinoHistoricoIncludeList? treinoHistoricos,
  }) {
    return TreinoInclude._(
      treinoExercicios: treinoExercicios,
      treinoHistoricos: treinoHistoricos,
    );
  }

  static TreinoIncludeList includeList({
    _i1.WhereExpressionBuilder<TreinoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TreinoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoTable>? orderByList,
    TreinoInclude? include,
  }) {
    return TreinoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Treino.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Treino.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TreinoImpl extends Treino {
  _TreinoImpl({
    int? id,
    required String descricao,
    required String objetivo,
    List<_i2.TreinoExercicio>? treinoExercicios,
    List<_i2.TreinoHistorico>? treinoHistoricos,
  }) : super._(
          id: id,
          descricao: descricao,
          objetivo: objetivo,
          treinoExercicios: treinoExercicios,
          treinoHistoricos: treinoHistoricos,
        );

  @override
  Treino copyWith({
    Object? id = _Undefined,
    String? descricao,
    String? objetivo,
    Object? treinoExercicios = _Undefined,
    Object? treinoHistoricos = _Undefined,
  }) {
    return Treino(
      id: id is int? ? id : this.id,
      descricao: descricao ?? this.descricao,
      objetivo: objetivo ?? this.objetivo,
      treinoExercicios: treinoExercicios is List<_i2.TreinoExercicio>?
          ? treinoExercicios
          : this.treinoExercicios?.map((e0) => e0.copyWith()).toList(),
      treinoHistoricos: treinoHistoricos is List<_i2.TreinoHistorico>?
          ? treinoHistoricos
          : this.treinoHistoricos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TreinoTable extends _i1.Table {
  TreinoTable({super.tableRelation}) : super(tableName: 'treino') {
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    objetivo = _i1.ColumnString(
      'objetivo',
      this,
    );
  }

  late final _i1.ColumnString descricao;

  late final _i1.ColumnString objetivo;

  _i2.TreinoExercicioTable? ___treinoExercicios;

  _i1.ManyRelation<_i2.TreinoExercicioTable>? _treinoExercicios;

  _i2.TreinoHistoricoTable? ___treinoHistoricos;

  _i1.ManyRelation<_i2.TreinoHistoricoTable>? _treinoHistoricos;

  _i2.TreinoExercicioTable get __treinoExercicios {
    if (___treinoExercicios != null) return ___treinoExercicios!;
    ___treinoExercicios = _i1.createRelationTable(
      relationFieldName: '__treinoExercicios',
      field: Treino.t.id,
      foreignField: _i2.TreinoExercicio.t.$_treinoTreinoexerciciosTreinoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoExercicioTable(tableRelation: foreignTableRelation),
    );
    return ___treinoExercicios!;
  }

  _i2.TreinoHistoricoTable get __treinoHistoricos {
    if (___treinoHistoricos != null) return ___treinoHistoricos!;
    ___treinoHistoricos = _i1.createRelationTable(
      relationFieldName: '__treinoHistoricos',
      field: Treino.t.id,
      foreignField: _i2.TreinoHistorico.t.$_treinoTreinohistoricosTreinoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoHistoricoTable(tableRelation: foreignTableRelation),
    );
    return ___treinoHistoricos!;
  }

  _i1.ManyRelation<_i2.TreinoExercicioTable> get treinoExercicios {
    if (_treinoExercicios != null) return _treinoExercicios!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'treinoExercicios',
      field: Treino.t.id,
      foreignField: _i2.TreinoExercicio.t.$_treinoTreinoexerciciosTreinoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoExercicioTable(tableRelation: foreignTableRelation),
    );
    _treinoExercicios = _i1.ManyRelation<_i2.TreinoExercicioTable>(
      tableWithRelations: relationTable,
      table: _i2.TreinoExercicioTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _treinoExercicios!;
  }

  _i1.ManyRelation<_i2.TreinoHistoricoTable> get treinoHistoricos {
    if (_treinoHistoricos != null) return _treinoHistoricos!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'treinoHistoricos',
      field: Treino.t.id,
      foreignField: _i2.TreinoHistorico.t.$_treinoTreinohistoricosTreinoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoHistoricoTable(tableRelation: foreignTableRelation),
    );
    _treinoHistoricos = _i1.ManyRelation<_i2.TreinoHistoricoTable>(
      tableWithRelations: relationTable,
      table: _i2.TreinoHistoricoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _treinoHistoricos!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        descricao,
        objetivo,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'treinoExercicios') {
      return __treinoExercicios;
    }
    if (relationField == 'treinoHistoricos') {
      return __treinoHistoricos;
    }
    return null;
  }
}

class TreinoInclude extends _i1.IncludeObject {
  TreinoInclude._({
    _i2.TreinoExercicioIncludeList? treinoExercicios,
    _i2.TreinoHistoricoIncludeList? treinoHistoricos,
  }) {
    _treinoExercicios = treinoExercicios;
    _treinoHistoricos = treinoHistoricos;
  }

  _i2.TreinoExercicioIncludeList? _treinoExercicios;

  _i2.TreinoHistoricoIncludeList? _treinoHistoricos;

  @override
  Map<String, _i1.Include?> get includes => {
        'treinoExercicios': _treinoExercicios,
        'treinoHistoricos': _treinoHistoricos,
      };

  @override
  _i1.Table get table => Treino.t;
}

class TreinoIncludeList extends _i1.IncludeList {
  TreinoIncludeList._({
    _i1.WhereExpressionBuilder<TreinoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Treino.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Treino.t;
}

class TreinoRepository {
  const TreinoRepository._();

  final attach = const TreinoAttachRepository._();

  final attachRow = const TreinoAttachRowRepository._();

  final detach = const TreinoDetachRepository._();

  final detachRow = const TreinoDetachRowRepository._();

  Future<List<Treino>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TreinoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TreinoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoTable>? orderByList,
    _i1.Transaction? transaction,
    TreinoInclude? include,
  }) async {
    return databaseAccessor.db.find<Treino>(
      where: where?.call(Treino.t),
      orderBy: orderBy?.call(Treino.t),
      orderByList: orderByList?.call(Treino.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Treino?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TreinoTable>? where,
    int? offset,
    _i1.OrderByBuilder<TreinoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoTable>? orderByList,
    _i1.Transaction? transaction,
    TreinoInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<Treino>(
      where: where?.call(Treino.t),
      orderBy: orderBy?.call(Treino.t),
      orderByList: orderByList?.call(Treino.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<Treino?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    TreinoInclude? include,
  }) async {
    return databaseAccessor.db.findById<Treino>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<Treino>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<Treino> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<Treino>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Treino> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    Treino row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<Treino>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Treino>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<Treino> rows, {
    _i1.ColumnSelections<TreinoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<Treino>(
      rows,
      columns: columns?.call(Treino.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Treino> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    Treino row, {
    _i1.ColumnSelections<TreinoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<Treino>(
      row,
      columns: columns?.call(Treino.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Treino>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<Treino> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<Treino>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<Treino> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    Treino row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<Treino>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<Treino>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<TreinoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<Treino>(
      where: where(Treino.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TreinoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<Treino>(
      where: where?.call(Treino.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoAttachRepository {
  const TreinoAttachRepository._();

  Future<void> treinoExercicios(
    _i1.DatabaseAccessor databaseAccessor,
    Treino treino,
    List<_i2.TreinoExercicio> treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treinoExercicio = treinoExercicio
        .map((e) => _i2.TreinoExercicioImplicit(
              e,
              $_treinoTreinoexerciciosTreinoId: treino.id,
            ))
        .toList();
    await databaseAccessor.db.update<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.$_treinoTreinoexerciciosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> treinoHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    Treino treino,
    List<_i2.TreinoHistorico> treinoHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoHistorico.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoHistorico.id');
    }
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treinoHistorico = treinoHistorico
        .map((e) => _i2.TreinoHistoricoImplicit(
              e,
              $_treinoTreinohistoricosTreinoId: treino.id,
            ))
        .toList();
    await databaseAccessor.db.update<_i2.TreinoHistorico>(
      $treinoHistorico,
      columns: [_i2.TreinoHistorico.t.$_treinoTreinohistoricosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoAttachRowRepository {
  const TreinoAttachRowRepository._();

  Future<void> treinoExercicios(
    _i1.DatabaseAccessor databaseAccessor,
    Treino treino,
    _i2.TreinoExercicio treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treinoExercicio = _i2.TreinoExercicioImplicit(
      treinoExercicio,
      $_treinoTreinoexerciciosTreinoId: treino.id,
    );
    await databaseAccessor.db.updateRow<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.$_treinoTreinoexerciciosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> treinoHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    Treino treino,
    _i2.TreinoHistorico treinoHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoHistorico.id == null) {
      throw ArgumentError.notNull('treinoHistorico.id');
    }
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treinoHistorico = _i2.TreinoHistoricoImplicit(
      treinoHistorico,
      $_treinoTreinohistoricosTreinoId: treino.id,
    );
    await databaseAccessor.db.updateRow<_i2.TreinoHistorico>(
      $treinoHistorico,
      columns: [_i2.TreinoHistorico.t.$_treinoTreinohistoricosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoDetachRepository {
  const TreinoDetachRepository._();

  Future<void> treinoExercicios(
    _i1.DatabaseAccessor databaseAccessor,
    List<_i2.TreinoExercicio> treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }

    var $treinoExercicio = treinoExercicio
        .map((e) => _i2.TreinoExercicioImplicit(
              e,
              $_treinoTreinoexerciciosTreinoId: null,
            ))
        .toList();
    await databaseAccessor.db.update<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.$_treinoTreinoexerciciosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> treinoHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    List<_i2.TreinoHistorico> treinoHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoHistorico.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoHistorico.id');
    }

    var $treinoHistorico = treinoHistorico
        .map((e) => _i2.TreinoHistoricoImplicit(
              e,
              $_treinoTreinohistoricosTreinoId: null,
            ))
        .toList();
    await databaseAccessor.db.update<_i2.TreinoHistorico>(
      $treinoHistorico,
      columns: [_i2.TreinoHistorico.t.$_treinoTreinohistoricosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoDetachRowRepository {
  const TreinoDetachRowRepository._();

  Future<void> treinoExercicios(
    _i1.DatabaseAccessor databaseAccessor,
    _i2.TreinoExercicio treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }

    var $treinoExercicio = _i2.TreinoExercicioImplicit(
      treinoExercicio,
      $_treinoTreinoexerciciosTreinoId: null,
    );
    await databaseAccessor.db.updateRow<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.$_treinoTreinoexerciciosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> treinoHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    _i2.TreinoHistorico treinoHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoHistorico.id == null) {
      throw ArgumentError.notNull('treinoHistorico.id');
    }

    var $treinoHistorico = _i2.TreinoHistoricoImplicit(
      treinoHistorico,
      $_treinoTreinohistoricosTreinoId: null,
    );
    await databaseAccessor.db.updateRow<_i2.TreinoHistorico>(
      $treinoHistorico,
      columns: [_i2.TreinoHistorico.t.$_treinoTreinohistoricosTreinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

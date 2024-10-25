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

abstract class TreinoExercicio extends _i1.TableRow
    implements _i1.ProtocolSerialization {
  TreinoExercicio._({
    int? id,
    required this.repeticoes,
    required this.series,
    required this.treinoId,
    this.treino,
    required this.exercicioId,
    this.exercicio,
    this.treinoExercicioHistoricos,
  }) : super(id);

  factory TreinoExercicio({
    int? id,
    required int repeticoes,
    required int series,
    required int treinoId,
    _i2.Treino? treino,
    required int exercicioId,
    _i2.Exercicio? exercicio,
    List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos,
  }) = _TreinoExercicioImpl;

  factory TreinoExercicio.fromJson(Map<String, dynamic> jsonSerialization) {
    return TreinoExercicio(
      id: jsonSerialization['id'] as int?,
      repeticoes: jsonSerialization['repeticoes'] as int,
      series: jsonSerialization['series'] as int,
      treinoId: jsonSerialization['treinoId'] as int,
      treino: jsonSerialization['treino'] == null
          ? null
          : _i2.Treino.fromJson(
              (jsonSerialization['treino'] as Map<String, dynamic>)),
      exercicioId: jsonSerialization['exercicioId'] as int,
      exercicio: jsonSerialization['exercicio'] == null
          ? null
          : _i2.Exercicio.fromJson(
              (jsonSerialization['exercicio'] as Map<String, dynamic>)),
      treinoExercicioHistoricos:
          (jsonSerialization['treinoExercicioHistoricos'] as List?)
              ?.map((e) => _i2.TreinoExercicioHistorico.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
    );
  }

  static final t = TreinoExercicioTable();

  static const db = TreinoExercicioRepository._();

  int repeticoes;

  int series;

  int treinoId;

  _i2.Treino? treino;

  int exercicioId;

  _i2.Exercicio? exercicio;

  List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos;

  @override
  _i1.Table get table => t;

  TreinoExercicio copyWith({
    int? id,
    int? repeticoes,
    int? series,
    int? treinoId,
    _i2.Treino? treino,
    int? exercicioId,
    _i2.Exercicio? exercicio,
    List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'repeticoes': repeticoes,
      'series': series,
      'treinoId': treinoId,
      if (treino != null) 'treino': treino?.toJson(),
      'exercicioId': exercicioId,
      if (exercicio != null) 'exercicio': exercicio?.toJson(),
      if (treinoExercicioHistoricos != null)
        'treinoExercicioHistoricos':
            treinoExercicioHistoricos?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'repeticoes': repeticoes,
      'series': series,
      'treinoId': treinoId,
      if (treino != null) 'treino': treino?.toJsonForProtocol(),
      'exercicioId': exercicioId,
      if (exercicio != null) 'exercicio': exercicio?.toJsonForProtocol(),
      if (treinoExercicioHistoricos != null)
        'treinoExercicioHistoricos': treinoExercicioHistoricos?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static TreinoExercicioInclude include({
    _i2.TreinoInclude? treino,
    _i2.ExercicioInclude? exercicio,
    _i2.TreinoExercicioHistoricoIncludeList? treinoExercicioHistoricos,
  }) {
    return TreinoExercicioInclude._(
      treino: treino,
      exercicio: exercicio,
      treinoExercicioHistoricos: treinoExercicioHistoricos,
    );
  }

  static TreinoExercicioIncludeList includeList({
    _i1.WhereExpressionBuilder<TreinoExercicioTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TreinoExercicioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoExercicioTable>? orderByList,
    TreinoExercicioInclude? include,
  }) {
    return TreinoExercicioIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(TreinoExercicio.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(TreinoExercicio.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TreinoExercicioImpl extends TreinoExercicio {
  _TreinoExercicioImpl({
    int? id,
    required int repeticoes,
    required int series,
    required int treinoId,
    _i2.Treino? treino,
    required int exercicioId,
    _i2.Exercicio? exercicio,
    List<_i2.TreinoExercicioHistorico>? treinoExercicioHistoricos,
  }) : super._(
          id: id,
          repeticoes: repeticoes,
          series: series,
          treinoId: treinoId,
          treino: treino,
          exercicioId: exercicioId,
          exercicio: exercicio,
          treinoExercicioHistoricos: treinoExercicioHistoricos,
        );

  @override
  TreinoExercicio copyWith({
    Object? id = _Undefined,
    int? repeticoes,
    int? series,
    int? treinoId,
    Object? treino = _Undefined,
    int? exercicioId,
    Object? exercicio = _Undefined,
    Object? treinoExercicioHistoricos = _Undefined,
  }) {
    return TreinoExercicio(
      id: id is int? ? id : this.id,
      repeticoes: repeticoes ?? this.repeticoes,
      series: series ?? this.series,
      treinoId: treinoId ?? this.treinoId,
      treino: treino is _i2.Treino? ? treino : this.treino?.copyWith(),
      exercicioId: exercicioId ?? this.exercicioId,
      exercicio:
          exercicio is _i2.Exercicio? ? exercicio : this.exercicio?.copyWith(),
      treinoExercicioHistoricos: treinoExercicioHistoricos
              is List<_i2.TreinoExercicioHistorico>?
          ? treinoExercicioHistoricos
          : this.treinoExercicioHistoricos?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class TreinoExercicioTable extends _i1.Table {
  TreinoExercicioTable({super.tableRelation})
      : super(tableName: 'treino_exercicio') {
    repeticoes = _i1.ColumnInt(
      'repeticoes',
      this,
    );
    series = _i1.ColumnInt(
      'series',
      this,
    );
    treinoId = _i1.ColumnInt(
      'treinoId',
      this,
    );
    exercicioId = _i1.ColumnInt(
      'exercicioId',
      this,
    );
  }

  late final _i1.ColumnInt repeticoes;

  late final _i1.ColumnInt series;

  late final _i1.ColumnInt treinoId;

  _i2.TreinoTable? _treino;

  late final _i1.ColumnInt exercicioId;

  _i2.ExercicioTable? _exercicio;

  _i2.TreinoExercicioHistoricoTable? ___treinoExercicioHistoricos;

  _i1.ManyRelation<_i2.TreinoExercicioHistoricoTable>?
      _treinoExercicioHistoricos;

  _i2.TreinoTable get treino {
    if (_treino != null) return _treino!;
    _treino = _i1.createRelationTable(
      relationFieldName: 'treino',
      field: TreinoExercicio.t.treinoId,
      foreignField: _i2.Treino.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoTable(tableRelation: foreignTableRelation),
    );
    return _treino!;
  }

  _i2.ExercicioTable get exercicio {
    if (_exercicio != null) return _exercicio!;
    _exercicio = _i1.createRelationTable(
      relationFieldName: 'exercicio',
      field: TreinoExercicio.t.exercicioId,
      foreignField: _i2.Exercicio.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ExercicioTable(tableRelation: foreignTableRelation),
    );
    return _exercicio!;
  }

  _i2.TreinoExercicioHistoricoTable get __treinoExercicioHistoricos {
    if (___treinoExercicioHistoricos != null)
      return ___treinoExercicioHistoricos!;
    ___treinoExercicioHistoricos = _i1.createRelationTable(
      relationFieldName: '__treinoExercicioHistoricos',
      field: TreinoExercicio.t.id,
      foreignField: _i2.TreinoExercicioHistorico.t.treinoExercicioId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i2.TreinoExercicioHistoricoTable(
          tableRelation: foreignTableRelation),
    );
    return ___treinoExercicioHistoricos!;
  }

  _i1.ManyRelation<_i2.TreinoExercicioHistoricoTable>
      get treinoExercicioHistoricos {
    if (_treinoExercicioHistoricos != null) return _treinoExercicioHistoricos!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'treinoExercicioHistoricos',
      field: TreinoExercicio.t.id,
      foreignField: _i2.TreinoExercicioHistorico.t.treinoExercicioId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) => _i2.TreinoExercicioHistoricoTable(
          tableRelation: foreignTableRelation),
    );
    _treinoExercicioHistoricos =
        _i1.ManyRelation<_i2.TreinoExercicioHistoricoTable>(
      tableWithRelations: relationTable,
      table: _i2.TreinoExercicioHistoricoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _treinoExercicioHistoricos!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        repeticoes,
        series,
        treinoId,
        exercicioId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'treino') {
      return treino;
    }
    if (relationField == 'exercicio') {
      return exercicio;
    }
    if (relationField == 'treinoExercicioHistoricos') {
      return __treinoExercicioHistoricos;
    }
    return null;
  }
}

class TreinoExercicioInclude extends _i1.IncludeObject {
  TreinoExercicioInclude._({
    _i2.TreinoInclude? treino,
    _i2.ExercicioInclude? exercicio,
    _i2.TreinoExercicioHistoricoIncludeList? treinoExercicioHistoricos,
  }) {
    _treino = treino;
    _exercicio = exercicio;
    _treinoExercicioHistoricos = treinoExercicioHistoricos;
  }

  _i2.TreinoInclude? _treino;

  _i2.ExercicioInclude? _exercicio;

  _i2.TreinoExercicioHistoricoIncludeList? _treinoExercicioHistoricos;

  @override
  Map<String, _i1.Include?> get includes => {
        'treino': _treino,
        'exercicio': _exercicio,
        'treinoExercicioHistoricos': _treinoExercicioHistoricos,
      };

  @override
  _i1.Table get table => TreinoExercicio.t;
}

class TreinoExercicioIncludeList extends _i1.IncludeList {
  TreinoExercicioIncludeList._({
    _i1.WhereExpressionBuilder<TreinoExercicioTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(TreinoExercicio.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => TreinoExercicio.t;
}

class TreinoExercicioRepository {
  const TreinoExercicioRepository._();

  final attach = const TreinoExercicioAttachRepository._();

  final attachRow = const TreinoExercicioAttachRowRepository._();

  final detach = const TreinoExercicioDetachRepository._();

  final detachRow = const TreinoExercicioDetachRowRepository._();

  Future<List<TreinoExercicio>> find(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TreinoExercicioTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TreinoExercicioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoExercicioTable>? orderByList,
    _i1.Transaction? transaction,
    TreinoExercicioInclude? include,
  }) async {
    return databaseAccessor.db.find<TreinoExercicio>(
      where: where?.call(TreinoExercicio.t),
      orderBy: orderBy?.call(TreinoExercicio.t),
      orderByList: orderByList?.call(TreinoExercicio.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<TreinoExercicio?> findFirstRow(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TreinoExercicioTable>? where,
    int? offset,
    _i1.OrderByBuilder<TreinoExercicioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TreinoExercicioTable>? orderByList,
    _i1.Transaction? transaction,
    TreinoExercicioInclude? include,
  }) async {
    return databaseAccessor.db.findFirstRow<TreinoExercicio>(
      where: where?.call(TreinoExercicio.t),
      orderBy: orderBy?.call(TreinoExercicio.t),
      orderByList: orderByList?.call(TreinoExercicio.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<TreinoExercicio?> findById(
    _i1.DatabaseAccessor databaseAccessor,
    int id, {
    _i1.Transaction? transaction,
    TreinoExercicioInclude? include,
  }) async {
    return databaseAccessor.db.findById<TreinoExercicio>(
      id,
      transaction: transaction ?? databaseAccessor.transaction,
      include: include,
    );
  }

  Future<List<TreinoExercicio>> insert(
    _i1.DatabaseAccessor databaseAccessor,
    List<TreinoExercicio> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insert<TreinoExercicio>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TreinoExercicio> insertRow(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.insertRow<TreinoExercicio>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TreinoExercicio>> update(
    _i1.DatabaseAccessor databaseAccessor,
    List<TreinoExercicio> rows, {
    _i1.ColumnSelections<TreinoExercicioTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.update<TreinoExercicio>(
      rows,
      columns: columns?.call(TreinoExercicio.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TreinoExercicio> updateRow(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio row, {
    _i1.ColumnSelections<TreinoExercicioTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.updateRow<TreinoExercicio>(
      row,
      columns: columns?.call(TreinoExercicio.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TreinoExercicio>> delete(
    _i1.DatabaseAccessor databaseAccessor,
    List<TreinoExercicio> rows, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.delete<TreinoExercicio>(
      rows,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<TreinoExercicio> deleteRow(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio row, {
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteRow<TreinoExercicio>(
      row,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<List<TreinoExercicio>> deleteWhere(
    _i1.DatabaseAccessor databaseAccessor, {
    required _i1.WhereExpressionBuilder<TreinoExercicioTable> where,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.deleteWhere<TreinoExercicio>(
      where: where(TreinoExercicio.t),
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<int> count(
    _i1.DatabaseAccessor databaseAccessor, {
    _i1.WhereExpressionBuilder<TreinoExercicioTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return databaseAccessor.db.count<TreinoExercicio>(
      where: where?.call(TreinoExercicio.t),
      limit: limit,
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoExercicioAttachRepository {
  const TreinoExercicioAttachRepository._();

  Future<void> treinoExercicioHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio treinoExercicio,
    List<_i2.TreinoExercicioHistorico> treinoExercicioHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicioHistorico.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoExercicioHistorico.id');
    }
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }

    var $treinoExercicioHistorico = treinoExercicioHistorico
        .map((e) => e.copyWith(treinoExercicioId: treinoExercicio.id))
        .toList();
    await databaseAccessor.db.update<_i2.TreinoExercicioHistorico>(
      $treinoExercicioHistorico,
      columns: [_i2.TreinoExercicioHistorico.t.treinoExercicioId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoExercicioAttachRowRepository {
  const TreinoExercicioAttachRowRepository._();

  Future<void> treino(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio treinoExercicio,
    _i2.Treino treino, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treinoExercicio = treinoExercicio.copyWith(treinoId: treino.id);
    await databaseAccessor.db.updateRow<TreinoExercicio>(
      $treinoExercicio,
      columns: [TreinoExercicio.t.treinoId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> exercicio(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio treinoExercicio,
    _i2.Exercicio exercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }
    if (exercicio.id == null) {
      throw ArgumentError.notNull('exercicio.id');
    }

    var $treinoExercicio = treinoExercicio.copyWith(exercicioId: exercicio.id);
    await databaseAccessor.db.updateRow<TreinoExercicio>(
      $treinoExercicio,
      columns: [TreinoExercicio.t.exercicioId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }

  Future<void> treinoExercicioHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    TreinoExercicio treinoExercicio,
    _i2.TreinoExercicioHistorico treinoExercicioHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicioHistorico.id == null) {
      throw ArgumentError.notNull('treinoExercicioHistorico.id');
    }
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }

    var $treinoExercicioHistorico = treinoExercicioHistorico.copyWith(
        treinoExercicioId: treinoExercicio.id);
    await databaseAccessor.db.updateRow<_i2.TreinoExercicioHistorico>(
      $treinoExercicioHistorico,
      columns: [_i2.TreinoExercicioHistorico.t.treinoExercicioId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoExercicioDetachRepository {
  const TreinoExercicioDetachRepository._();

  Future<void> treinoExercicioHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    List<_i2.TreinoExercicioHistorico> treinoExercicioHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicioHistorico.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoExercicioHistorico.id');
    }

    var $treinoExercicioHistorico = treinoExercicioHistorico
        .map((e) => e.copyWith(treinoExercicioId: null))
        .toList();
    await databaseAccessor.db.update<_i2.TreinoExercicioHistorico>(
      $treinoExercicioHistorico,
      columns: [_i2.TreinoExercicioHistorico.t.treinoExercicioId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

class TreinoExercicioDetachRowRepository {
  const TreinoExercicioDetachRowRepository._();

  Future<void> treinoExercicioHistoricos(
    _i1.DatabaseAccessor databaseAccessor,
    _i2.TreinoExercicioHistorico treinoExercicioHistorico, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicioHistorico.id == null) {
      throw ArgumentError.notNull('treinoExercicioHistorico.id');
    }

    var $treinoExercicioHistorico =
        treinoExercicioHistorico.copyWith(treinoExercicioId: null);
    await databaseAccessor.db.updateRow<_i2.TreinoExercicioHistorico>(
      $treinoExercicioHistorico,
      columns: [_i2.TreinoExercicioHistorico.t.treinoExercicioId],
      transaction: transaction ?? databaseAccessor.transaction,
    );
  }
}

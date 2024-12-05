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

abstract class Alimento implements _i1.TableRow, _i1.ProtocolSerialization {
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

  static final t = AlimentoTable();

  static const db = AlimentoRepository._();

  @override
  int? id;

  String tipo;

  int caloriasGrama;

  int proteinasGrama;

  String descricao;

  List<_i2.OpcaoAlimento>? opcoesAlimentos;

  @override
  _i1.Table get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'tipo': tipo,
      'caloriasGrama': caloriasGrama,
      'proteinasGrama': proteinasGrama,
      'descricao': descricao,
      if (opcoesAlimentos != null)
        'opcoesAlimentos':
            opcoesAlimentos?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static AlimentoInclude include(
      {_i2.OpcaoAlimentoIncludeList? opcoesAlimentos}) {
    return AlimentoInclude._(opcoesAlimentos: opcoesAlimentos);
  }

  static AlimentoIncludeList includeList({
    _i1.WhereExpressionBuilder<AlimentoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AlimentoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlimentoTable>? orderByList,
    AlimentoInclude? include,
  }) {
    return AlimentoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Alimento.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Alimento.t),
      include: include,
    );
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

class AlimentoTable extends _i1.Table {
  AlimentoTable({super.tableRelation}) : super(tableName: 'alimento') {
    tipo = _i1.ColumnString(
      'tipo',
      this,
    );
    caloriasGrama = _i1.ColumnInt(
      'caloriasGrama',
      this,
    );
    proteinasGrama = _i1.ColumnInt(
      'proteinasGrama',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
  }

  late final _i1.ColumnString tipo;

  late final _i1.ColumnInt caloriasGrama;

  late final _i1.ColumnInt proteinasGrama;

  late final _i1.ColumnString descricao;

  _i2.OpcaoAlimentoTable? ___opcoesAlimentos;

  _i1.ManyRelation<_i2.OpcaoAlimentoTable>? _opcoesAlimentos;

  _i2.OpcaoAlimentoTable get __opcoesAlimentos {
    if (___opcoesAlimentos != null) return ___opcoesAlimentos!;
    ___opcoesAlimentos = _i1.createRelationTable(
      relationFieldName: '__opcoesAlimentos',
      field: Alimento.t.id,
      foreignField: _i2.OpcaoAlimento.t.alimentoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OpcaoAlimentoTable(tableRelation: foreignTableRelation),
    );
    return ___opcoesAlimentos!;
  }

  _i1.ManyRelation<_i2.OpcaoAlimentoTable> get opcoesAlimentos {
    if (_opcoesAlimentos != null) return _opcoesAlimentos!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'opcoesAlimentos',
      field: Alimento.t.id,
      foreignField: _i2.OpcaoAlimento.t.alimentoId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.OpcaoAlimentoTable(tableRelation: foreignTableRelation),
    );
    _opcoesAlimentos = _i1.ManyRelation<_i2.OpcaoAlimentoTable>(
      tableWithRelations: relationTable,
      table: _i2.OpcaoAlimentoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _opcoesAlimentos!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        tipo,
        caloriasGrama,
        proteinasGrama,
        descricao,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'opcoesAlimentos') {
      return __opcoesAlimentos;
    }
    return null;
  }
}

class AlimentoInclude extends _i1.IncludeObject {
  AlimentoInclude._({_i2.OpcaoAlimentoIncludeList? opcoesAlimentos}) {
    _opcoesAlimentos = opcoesAlimentos;
  }

  _i2.OpcaoAlimentoIncludeList? _opcoesAlimentos;

  @override
  Map<String, _i1.Include?> get includes =>
      {'opcoesAlimentos': _opcoesAlimentos};

  @override
  _i1.Table get table => Alimento.t;
}

class AlimentoIncludeList extends _i1.IncludeList {
  AlimentoIncludeList._({
    _i1.WhereExpressionBuilder<AlimentoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Alimento.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Alimento.t;
}

class AlimentoRepository {
  const AlimentoRepository._();

  final attach = const AlimentoAttachRepository._();

  final attachRow = const AlimentoAttachRowRepository._();

  final detach = const AlimentoDetachRepository._();

  final detachRow = const AlimentoDetachRowRepository._();

  Future<List<Alimento>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlimentoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<AlimentoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlimentoTable>? orderByList,
    _i1.Transaction? transaction,
    AlimentoInclude? include,
  }) async {
    return session.db.find<Alimento>(
      where: where?.call(Alimento.t),
      orderBy: orderBy?.call(Alimento.t),
      orderByList: orderByList?.call(Alimento.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Alimento?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlimentoTable>? where,
    int? offset,
    _i1.OrderByBuilder<AlimentoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<AlimentoTable>? orderByList,
    _i1.Transaction? transaction,
    AlimentoInclude? include,
  }) async {
    return session.db.findFirstRow<Alimento>(
      where: where?.call(Alimento.t),
      orderBy: orderBy?.call(Alimento.t),
      orderByList: orderByList?.call(Alimento.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Alimento?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    AlimentoInclude? include,
  }) async {
    return session.db.findById<Alimento>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Alimento>> insert(
    _i1.Session session,
    List<Alimento> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Alimento>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Alimento> insertRow(
    _i1.Session session,
    Alimento row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Alimento>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Alimento>> update(
    _i1.Session session,
    List<Alimento> rows, {
    _i1.ColumnSelections<AlimentoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Alimento>(
      rows,
      columns: columns?.call(Alimento.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Alimento> updateRow(
    _i1.Session session,
    Alimento row, {
    _i1.ColumnSelections<AlimentoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Alimento>(
      row,
      columns: columns?.call(Alimento.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Alimento>> delete(
    _i1.Session session,
    List<Alimento> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Alimento>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Alimento> deleteRow(
    _i1.Session session,
    Alimento row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Alimento>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Alimento>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<AlimentoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Alimento>(
      where: where(Alimento.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<AlimentoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Alimento>(
      where: where?.call(Alimento.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class AlimentoAttachRepository {
  const AlimentoAttachRepository._();

  Future<void> opcoesAlimentos(
    _i1.Session session,
    Alimento alimento,
    List<_i2.OpcaoAlimento> opcaoAlimento, {
    _i1.Transaction? transaction,
  }) async {
    if (opcaoAlimento.any((e) => e.id == null)) {
      throw ArgumentError.notNull('opcaoAlimento.id');
    }
    if (alimento.id == null) {
      throw ArgumentError.notNull('alimento.id');
    }

    var $opcaoAlimento =
        opcaoAlimento.map((e) => e.copyWith(alimentoId: alimento.id)).toList();
    await session.db.update<_i2.OpcaoAlimento>(
      $opcaoAlimento,
      columns: [_i2.OpcaoAlimento.t.alimentoId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class AlimentoAttachRowRepository {
  const AlimentoAttachRowRepository._();

  Future<void> opcoesAlimentos(
    _i1.Session session,
    Alimento alimento,
    _i2.OpcaoAlimento opcaoAlimento, {
    _i1.Transaction? transaction,
  }) async {
    if (opcaoAlimento.id == null) {
      throw ArgumentError.notNull('opcaoAlimento.id');
    }
    if (alimento.id == null) {
      throw ArgumentError.notNull('alimento.id');
    }

    var $opcaoAlimento = opcaoAlimento.copyWith(alimentoId: alimento.id);
    await session.db.updateRow<_i2.OpcaoAlimento>(
      $opcaoAlimento,
      columns: [_i2.OpcaoAlimento.t.alimentoId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class AlimentoDetachRepository {
  const AlimentoDetachRepository._();

  Future<void> opcoesAlimentos(
    _i1.Session session,
    List<_i2.OpcaoAlimento> opcaoAlimento, {
    _i1.Transaction? transaction,
  }) async {
    if (opcaoAlimento.any((e) => e.id == null)) {
      throw ArgumentError.notNull('opcaoAlimento.id');
    }

    var $opcaoAlimento =
        opcaoAlimento.map((e) => e.copyWith(alimentoId: null)).toList();
    await session.db.update<_i2.OpcaoAlimento>(
      $opcaoAlimento,
      columns: [_i2.OpcaoAlimento.t.alimentoId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class AlimentoDetachRowRepository {
  const AlimentoDetachRowRepository._();

  Future<void> opcoesAlimentos(
    _i1.Session session,
    _i2.OpcaoAlimento opcaoAlimento, {
    _i1.Transaction? transaction,
  }) async {
    if (opcaoAlimento.id == null) {
      throw ArgumentError.notNull('opcaoAlimento.id');
    }

    var $opcaoAlimento = opcaoAlimento.copyWith(alimentoId: null);
    await session.db.updateRow<_i2.OpcaoAlimento>(
      $opcaoAlimento,
      columns: [_i2.OpcaoAlimento.t.alimentoId],
      transaction: transaction ?? session.transaction,
    );
  }
}

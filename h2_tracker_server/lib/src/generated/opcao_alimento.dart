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

abstract class OpcaoAlimento
    implements _i1.TableRow, _i1.ProtocolSerialization {
  OpcaoAlimento._({
    this.id,
    required this.quantidade,
    required this.refeicaoId,
    this.refeicao,
    required this.alimentoId,
    this.alimento,
  });

  factory OpcaoAlimento({
    int? id,
    required int quantidade,
    required int refeicaoId,
    _i2.Refeicao? refeicao,
    required int alimentoId,
    _i2.Alimento? alimento,
  }) = _OpcaoAlimentoImpl;

  factory OpcaoAlimento.fromJson(Map<String, dynamic> jsonSerialization) {
    return OpcaoAlimento(
      id: jsonSerialization['id'] as int?,
      quantidade: jsonSerialization['quantidade'] as int,
      refeicaoId: jsonSerialization['refeicaoId'] as int,
      refeicao: jsonSerialization['refeicao'] == null
          ? null
          : _i2.Refeicao.fromJson(
              (jsonSerialization['refeicao'] as Map<String, dynamic>)),
      alimentoId: jsonSerialization['alimentoId'] as int,
      alimento: jsonSerialization['alimento'] == null
          ? null
          : _i2.Alimento.fromJson(
              (jsonSerialization['alimento'] as Map<String, dynamic>)),
    );
  }

  static final t = OpcaoAlimentoTable();

  static const db = OpcaoAlimentoRepository._();

  @override
  int? id;

  int quantidade;

  int refeicaoId;

  _i2.Refeicao? refeicao;

  int alimentoId;

  _i2.Alimento? alimento;

  @override
  _i1.Table get table => t;

  OpcaoAlimento copyWith({
    int? id,
    int? quantidade,
    int? refeicaoId,
    _i2.Refeicao? refeicao,
    int? alimentoId,
    _i2.Alimento? alimento,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'quantidade': quantidade,
      'refeicaoId': refeicaoId,
      if (refeicao != null) 'refeicao': refeicao?.toJson(),
      'alimentoId': alimentoId,
      if (alimento != null) 'alimento': alimento?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'quantidade': quantidade,
      'refeicaoId': refeicaoId,
      if (refeicao != null) 'refeicao': refeicao?.toJsonForProtocol(),
      'alimentoId': alimentoId,
      if (alimento != null) 'alimento': alimento?.toJsonForProtocol(),
    };
  }

  static OpcaoAlimentoInclude include({
    _i2.RefeicaoInclude? refeicao,
    _i2.AlimentoInclude? alimento,
  }) {
    return OpcaoAlimentoInclude._(
      refeicao: refeicao,
      alimento: alimento,
    );
  }

  static OpcaoAlimentoIncludeList includeList({
    _i1.WhereExpressionBuilder<OpcaoAlimentoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OpcaoAlimentoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OpcaoAlimentoTable>? orderByList,
    OpcaoAlimentoInclude? include,
  }) {
    return OpcaoAlimentoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(OpcaoAlimento.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(OpcaoAlimento.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _OpcaoAlimentoImpl extends OpcaoAlimento {
  _OpcaoAlimentoImpl({
    int? id,
    required int quantidade,
    required int refeicaoId,
    _i2.Refeicao? refeicao,
    required int alimentoId,
    _i2.Alimento? alimento,
  }) : super._(
          id: id,
          quantidade: quantidade,
          refeicaoId: refeicaoId,
          refeicao: refeicao,
          alimentoId: alimentoId,
          alimento: alimento,
        );

  @override
  OpcaoAlimento copyWith({
    Object? id = _Undefined,
    int? quantidade,
    int? refeicaoId,
    Object? refeicao = _Undefined,
    int? alimentoId,
    Object? alimento = _Undefined,
  }) {
    return OpcaoAlimento(
      id: id is int? ? id : this.id,
      quantidade: quantidade ?? this.quantidade,
      refeicaoId: refeicaoId ?? this.refeicaoId,
      refeicao:
          refeicao is _i2.Refeicao? ? refeicao : this.refeicao?.copyWith(),
      alimentoId: alimentoId ?? this.alimentoId,
      alimento:
          alimento is _i2.Alimento? ? alimento : this.alimento?.copyWith(),
    );
  }
}

class OpcaoAlimentoTable extends _i1.Table {
  OpcaoAlimentoTable({super.tableRelation})
      : super(tableName: 'opcao_alimento') {
    quantidade = _i1.ColumnInt(
      'quantidade',
      this,
    );
    refeicaoId = _i1.ColumnInt(
      'refeicaoId',
      this,
    );
    alimentoId = _i1.ColumnInt(
      'alimentoId',
      this,
    );
  }

  late final _i1.ColumnInt quantidade;

  late final _i1.ColumnInt refeicaoId;

  _i2.RefeicaoTable? _refeicao;

  late final _i1.ColumnInt alimentoId;

  _i2.AlimentoTable? _alimento;

  _i2.RefeicaoTable get refeicao {
    if (_refeicao != null) return _refeicao!;
    _refeicao = _i1.createRelationTable(
      relationFieldName: 'refeicao',
      field: OpcaoAlimento.t.refeicaoId,
      foreignField: _i2.Refeicao.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RefeicaoTable(tableRelation: foreignTableRelation),
    );
    return _refeicao!;
  }

  _i2.AlimentoTable get alimento {
    if (_alimento != null) return _alimento!;
    _alimento = _i1.createRelationTable(
      relationFieldName: 'alimento',
      field: OpcaoAlimento.t.alimentoId,
      foreignField: _i2.Alimento.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AlimentoTable(tableRelation: foreignTableRelation),
    );
    return _alimento!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        quantidade,
        refeicaoId,
        alimentoId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'refeicao') {
      return refeicao;
    }
    if (relationField == 'alimento') {
      return alimento;
    }
    return null;
  }
}

class OpcaoAlimentoInclude extends _i1.IncludeObject {
  OpcaoAlimentoInclude._({
    _i2.RefeicaoInclude? refeicao,
    _i2.AlimentoInclude? alimento,
  }) {
    _refeicao = refeicao;
    _alimento = alimento;
  }

  _i2.RefeicaoInclude? _refeicao;

  _i2.AlimentoInclude? _alimento;

  @override
  Map<String, _i1.Include?> get includes => {
        'refeicao': _refeicao,
        'alimento': _alimento,
      };

  @override
  _i1.Table get table => OpcaoAlimento.t;
}

class OpcaoAlimentoIncludeList extends _i1.IncludeList {
  OpcaoAlimentoIncludeList._({
    _i1.WhereExpressionBuilder<OpcaoAlimentoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(OpcaoAlimento.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => OpcaoAlimento.t;
}

class OpcaoAlimentoRepository {
  const OpcaoAlimentoRepository._();

  final attachRow = const OpcaoAlimentoAttachRowRepository._();

  Future<List<OpcaoAlimento>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OpcaoAlimentoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<OpcaoAlimentoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OpcaoAlimentoTable>? orderByList,
    _i1.Transaction? transaction,
    OpcaoAlimentoInclude? include,
  }) async {
    return session.db.find<OpcaoAlimento>(
      where: where?.call(OpcaoAlimento.t),
      orderBy: orderBy?.call(OpcaoAlimento.t),
      orderByList: orderByList?.call(OpcaoAlimento.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<OpcaoAlimento?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OpcaoAlimentoTable>? where,
    int? offset,
    _i1.OrderByBuilder<OpcaoAlimentoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<OpcaoAlimentoTable>? orderByList,
    _i1.Transaction? transaction,
    OpcaoAlimentoInclude? include,
  }) async {
    return session.db.findFirstRow<OpcaoAlimento>(
      where: where?.call(OpcaoAlimento.t),
      orderBy: orderBy?.call(OpcaoAlimento.t),
      orderByList: orderByList?.call(OpcaoAlimento.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<OpcaoAlimento?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    OpcaoAlimentoInclude? include,
  }) async {
    return session.db.findById<OpcaoAlimento>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<OpcaoAlimento>> insert(
    _i1.Session session,
    List<OpcaoAlimento> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<OpcaoAlimento>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<OpcaoAlimento> insertRow(
    _i1.Session session,
    OpcaoAlimento row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<OpcaoAlimento>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<OpcaoAlimento>> update(
    _i1.Session session,
    List<OpcaoAlimento> rows, {
    _i1.ColumnSelections<OpcaoAlimentoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<OpcaoAlimento>(
      rows,
      columns: columns?.call(OpcaoAlimento.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<OpcaoAlimento> updateRow(
    _i1.Session session,
    OpcaoAlimento row, {
    _i1.ColumnSelections<OpcaoAlimentoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<OpcaoAlimento>(
      row,
      columns: columns?.call(OpcaoAlimento.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<OpcaoAlimento>> delete(
    _i1.Session session,
    List<OpcaoAlimento> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<OpcaoAlimento>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<OpcaoAlimento> deleteRow(
    _i1.Session session,
    OpcaoAlimento row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<OpcaoAlimento>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<OpcaoAlimento>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<OpcaoAlimentoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<OpcaoAlimento>(
      where: where(OpcaoAlimento.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<OpcaoAlimentoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<OpcaoAlimento>(
      where: where?.call(OpcaoAlimento.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class OpcaoAlimentoAttachRowRepository {
  const OpcaoAlimentoAttachRowRepository._();

  Future<void> refeicao(
    _i1.Session session,
    OpcaoAlimento opcaoAlimento,
    _i2.Refeicao refeicao, {
    _i1.Transaction? transaction,
  }) async {
    if (opcaoAlimento.id == null) {
      throw ArgumentError.notNull('opcaoAlimento.id');
    }
    if (refeicao.id == null) {
      throw ArgumentError.notNull('refeicao.id');
    }

    var $opcaoAlimento = opcaoAlimento.copyWith(refeicaoId: refeicao.id);
    await session.db.updateRow<OpcaoAlimento>(
      $opcaoAlimento,
      columns: [OpcaoAlimento.t.refeicaoId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> alimento(
    _i1.Session session,
    OpcaoAlimento opcaoAlimento,
    _i2.Alimento alimento, {
    _i1.Transaction? transaction,
  }) async {
    if (opcaoAlimento.id == null) {
      throw ArgumentError.notNull('opcaoAlimento.id');
    }
    if (alimento.id == null) {
      throw ArgumentError.notNull('alimento.id');
    }

    var $opcaoAlimento = opcaoAlimento.copyWith(alimentoId: alimento.id);
    await session.db.updateRow<OpcaoAlimento>(
      $opcaoAlimento,
      columns: [OpcaoAlimento.t.alimentoId],
      transaction: transaction ?? session.transaction,
    );
  }
}

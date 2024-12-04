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

abstract class Dieta implements _i1.TableRow, _i1.ProtocolSerialization {
  Dieta._({
    this.id,
    required this.caloriasMaximasDia,
    required this.objetivo,
    required this.descricao,
    required this.dataFim,
    required this.ativa,
    required this.pessoaId,
    this.pessoa,
    this.refeicoes,
  });

  factory Dieta({
    int? id,
    required int caloriasMaximasDia,
    required String objetivo,
    required String descricao,
    required DateTime dataFim,
    required bool ativa,
    required int pessoaId,
    _i2.Pessoa? pessoa,
    List<_i2.Refeicao>? refeicoes,
  }) = _DietaImpl;

  factory Dieta.fromJson(Map<String, dynamic> jsonSerialization) {
    return Dieta(
      id: jsonSerialization['id'] as int?,
      caloriasMaximasDia: jsonSerialization['caloriasMaximasDia'] as int,
      objetivo: jsonSerialization['objetivo'] as String,
      descricao: jsonSerialization['descricao'] as String,
      dataFim: _i1.DateTimeJsonExtension.fromJson(jsonSerialization['dataFim']),
      ativa: jsonSerialization['ativa'] as bool,
      pessoaId: jsonSerialization['pessoaId'] as int,
      pessoa: jsonSerialization['pessoa'] == null
          ? null
          : _i2.Pessoa.fromJson(
              (jsonSerialization['pessoa'] as Map<String, dynamic>)),
      refeicoes: (jsonSerialization['refeicoes'] as List?)
          ?.map((e) => _i2.Refeicao.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = DietaTable();

  static const db = DietaRepository._();

  @override
  int? id;

  int caloriasMaximasDia;

  String objetivo;

  String descricao;

  DateTime dataFim;

  bool ativa;

  int pessoaId;

  _i2.Pessoa? pessoa;

  List<_i2.Refeicao>? refeicoes;

  @override
  _i1.Table get table => t;

  Dieta copyWith({
    int? id,
    int? caloriasMaximasDia,
    String? objetivo,
    String? descricao,
    DateTime? dataFim,
    bool? ativa,
    int? pessoaId,
    _i2.Pessoa? pessoa,
    List<_i2.Refeicao>? refeicoes,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'caloriasMaximasDia': caloriasMaximasDia,
      'objetivo': objetivo,
      'descricao': descricao,
      'dataFim': dataFim.toJson(),
      'ativa': ativa,
      'pessoaId': pessoaId,
      if (pessoa != null) 'pessoa': pessoa?.toJson(),
      if (refeicoes != null)
        'refeicoes': refeicoes?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'caloriasMaximasDia': caloriasMaximasDia,
      'objetivo': objetivo,
      'descricao': descricao,
      'dataFim': dataFim.toJson(),
      'ativa': ativa,
      'pessoaId': pessoaId,
      if (pessoa != null) 'pessoa': pessoa?.toJsonForProtocol(),
      if (refeicoes != null)
        'refeicoes':
            refeicoes?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static DietaInclude include({
    _i2.PessoaInclude? pessoa,
    _i2.RefeicaoIncludeList? refeicoes,
  }) {
    return DietaInclude._(
      pessoa: pessoa,
      refeicoes: refeicoes,
    );
  }

  static DietaIncludeList includeList({
    _i1.WhereExpressionBuilder<DietaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DietaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DietaTable>? orderByList,
    DietaInclude? include,
  }) {
    return DietaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Dieta.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Dieta.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _DietaImpl extends Dieta {
  _DietaImpl({
    int? id,
    required int caloriasMaximasDia,
    required String objetivo,
    required String descricao,
    required DateTime dataFim,
    required bool ativa,
    required int pessoaId,
    _i2.Pessoa? pessoa,
    List<_i2.Refeicao>? refeicoes,
  }) : super._(
          id: id,
          caloriasMaximasDia: caloriasMaximasDia,
          objetivo: objetivo,
          descricao: descricao,
          dataFim: dataFim,
          ativa: ativa,
          pessoaId: pessoaId,
          pessoa: pessoa,
          refeicoes: refeicoes,
        );

  @override
  Dieta copyWith({
    Object? id = _Undefined,
    int? caloriasMaximasDia,
    String? objetivo,
    String? descricao,
    DateTime? dataFim,
    bool? ativa,
    int? pessoaId,
    Object? pessoa = _Undefined,
    Object? refeicoes = _Undefined,
  }) {
    return Dieta(
      id: id is int? ? id : this.id,
      caloriasMaximasDia: caloriasMaximasDia ?? this.caloriasMaximasDia,
      objetivo: objetivo ?? this.objetivo,
      descricao: descricao ?? this.descricao,
      dataFim: dataFim ?? this.dataFim,
      ativa: ativa ?? this.ativa,
      pessoaId: pessoaId ?? this.pessoaId,
      pessoa: pessoa is _i2.Pessoa? ? pessoa : this.pessoa?.copyWith(),
      refeicoes: refeicoes is List<_i2.Refeicao>?
          ? refeicoes
          : this.refeicoes?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class DietaTable extends _i1.Table {
  DietaTable({super.tableRelation}) : super(tableName: 'dieta') {
    caloriasMaximasDia = _i1.ColumnInt(
      'caloriasMaximasDia',
      this,
    );
    objetivo = _i1.ColumnString(
      'objetivo',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    dataFim = _i1.ColumnDateTime(
      'dataFim',
      this,
    );
    ativa = _i1.ColumnBool(
      'ativa',
      this,
    );
    pessoaId = _i1.ColumnInt(
      'pessoaId',
      this,
    );
  }

  late final _i1.ColumnInt caloriasMaximasDia;

  late final _i1.ColumnString objetivo;

  late final _i1.ColumnString descricao;

  late final _i1.ColumnDateTime dataFim;

  late final _i1.ColumnBool ativa;

  late final _i1.ColumnInt pessoaId;

  _i2.PessoaTable? _pessoa;

  _i2.RefeicaoTable? ___refeicoes;

  _i1.ManyRelation<_i2.RefeicaoTable>? _refeicoes;

  _i2.PessoaTable get pessoa {
    if (_pessoa != null) return _pessoa!;
    _pessoa = _i1.createRelationTable(
      relationFieldName: 'pessoa',
      field: Dieta.t.pessoaId,
      foreignField: _i2.Pessoa.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PessoaTable(tableRelation: foreignTableRelation),
    );
    return _pessoa!;
  }

  _i2.RefeicaoTable get __refeicoes {
    if (___refeicoes != null) return ___refeicoes!;
    ___refeicoes = _i1.createRelationTable(
      relationFieldName: '__refeicoes',
      field: Dieta.t.id,
      foreignField: _i2.Refeicao.t.dietaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RefeicaoTable(tableRelation: foreignTableRelation),
    );
    return ___refeicoes!;
  }

  _i1.ManyRelation<_i2.RefeicaoTable> get refeicoes {
    if (_refeicoes != null) return _refeicoes!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'refeicoes',
      field: Dieta.t.id,
      foreignField: _i2.Refeicao.t.dietaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.RefeicaoTable(tableRelation: foreignTableRelation),
    );
    _refeicoes = _i1.ManyRelation<_i2.RefeicaoTable>(
      tableWithRelations: relationTable,
      table: _i2.RefeicaoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _refeicoes!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        caloriasMaximasDia,
        objetivo,
        descricao,
        dataFim,
        ativa,
        pessoaId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'pessoa') {
      return pessoa;
    }
    if (relationField == 'refeicoes') {
      return __refeicoes;
    }
    return null;
  }
}

class DietaInclude extends _i1.IncludeObject {
  DietaInclude._({
    _i2.PessoaInclude? pessoa,
    _i2.RefeicaoIncludeList? refeicoes,
  }) {
    _pessoa = pessoa;
    _refeicoes = refeicoes;
  }

  _i2.PessoaInclude? _pessoa;

  _i2.RefeicaoIncludeList? _refeicoes;

  @override
  Map<String, _i1.Include?> get includes => {
        'pessoa': _pessoa,
        'refeicoes': _refeicoes,
      };

  @override
  _i1.Table get table => Dieta.t;
}

class DietaIncludeList extends _i1.IncludeList {
  DietaIncludeList._({
    _i1.WhereExpressionBuilder<DietaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Dieta.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Dieta.t;
}

class DietaRepository {
  const DietaRepository._();

  final attach = const DietaAttachRepository._();

  final attachRow = const DietaAttachRowRepository._();

  final detach = const DietaDetachRepository._();

  final detachRow = const DietaDetachRowRepository._();

  Future<List<Dieta>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DietaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<DietaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DietaTable>? orderByList,
    _i1.Transaction? transaction,
    DietaInclude? include,
  }) async {
    return session.db.find<Dieta>(
      where: where?.call(Dieta.t),
      orderBy: orderBy?.call(Dieta.t),
      orderByList: orderByList?.call(Dieta.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Dieta?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DietaTable>? where,
    int? offset,
    _i1.OrderByBuilder<DietaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<DietaTable>? orderByList,
    _i1.Transaction? transaction,
    DietaInclude? include,
  }) async {
    return session.db.findFirstRow<Dieta>(
      where: where?.call(Dieta.t),
      orderBy: orderBy?.call(Dieta.t),
      orderByList: orderByList?.call(Dieta.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Dieta?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    DietaInclude? include,
  }) async {
    return session.db.findById<Dieta>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Dieta>> insert(
    _i1.Session session,
    List<Dieta> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Dieta>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Dieta> insertRow(
    _i1.Session session,
    Dieta row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Dieta>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Dieta>> update(
    _i1.Session session,
    List<Dieta> rows, {
    _i1.ColumnSelections<DietaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Dieta>(
      rows,
      columns: columns?.call(Dieta.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Dieta> updateRow(
    _i1.Session session,
    Dieta row, {
    _i1.ColumnSelections<DietaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Dieta>(
      row,
      columns: columns?.call(Dieta.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Dieta>> delete(
    _i1.Session session,
    List<Dieta> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Dieta>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Dieta> deleteRow(
    _i1.Session session,
    Dieta row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Dieta>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Dieta>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<DietaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Dieta>(
      where: where(Dieta.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<DietaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Dieta>(
      where: where?.call(Dieta.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class DietaAttachRepository {
  const DietaAttachRepository._();

  Future<void> refeicoes(
    _i1.Session session,
    Dieta dieta,
    List<_i2.Refeicao> refeicao, {
    _i1.Transaction? transaction,
  }) async {
    if (refeicao.any((e) => e.id == null)) {
      throw ArgumentError.notNull('refeicao.id');
    }
    if (dieta.id == null) {
      throw ArgumentError.notNull('dieta.id');
    }

    var $refeicao = refeicao.map((e) => e.copyWith(dietaId: dieta.id)).toList();
    await session.db.update<_i2.Refeicao>(
      $refeicao,
      columns: [_i2.Refeicao.t.dietaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class DietaAttachRowRepository {
  const DietaAttachRowRepository._();

  Future<void> pessoa(
    _i1.Session session,
    Dieta dieta,
    _i2.Pessoa pessoa, {
    _i1.Transaction? transaction,
  }) async {
    if (dieta.id == null) {
      throw ArgumentError.notNull('dieta.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $dieta = dieta.copyWith(pessoaId: pessoa.id);
    await session.db.updateRow<Dieta>(
      $dieta,
      columns: [Dieta.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> refeicoes(
    _i1.Session session,
    Dieta dieta,
    _i2.Refeicao refeicao, {
    _i1.Transaction? transaction,
  }) async {
    if (refeicao.id == null) {
      throw ArgumentError.notNull('refeicao.id');
    }
    if (dieta.id == null) {
      throw ArgumentError.notNull('dieta.id');
    }

    var $refeicao = refeicao.copyWith(dietaId: dieta.id);
    await session.db.updateRow<_i2.Refeicao>(
      $refeicao,
      columns: [_i2.Refeicao.t.dietaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class DietaDetachRepository {
  const DietaDetachRepository._();

  Future<void> refeicoes(
    _i1.Session session,
    List<_i2.Refeicao> refeicao, {
    _i1.Transaction? transaction,
  }) async {
    if (refeicao.any((e) => e.id == null)) {
      throw ArgumentError.notNull('refeicao.id');
    }

    var $refeicao = refeicao.map((e) => e.copyWith(dietaId: null)).toList();
    await session.db.update<_i2.Refeicao>(
      $refeicao,
      columns: [_i2.Refeicao.t.dietaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class DietaDetachRowRepository {
  const DietaDetachRowRepository._();

  Future<void> refeicoes(
    _i1.Session session,
    _i2.Refeicao refeicao, {
    _i1.Transaction? transaction,
  }) async {
    if (refeicao.id == null) {
      throw ArgumentError.notNull('refeicao.id');
    }

    var $refeicao = refeicao.copyWith(dietaId: null);
    await session.db.updateRow<_i2.Refeicao>(
      $refeicao,
      columns: [_i2.Refeicao.t.dietaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

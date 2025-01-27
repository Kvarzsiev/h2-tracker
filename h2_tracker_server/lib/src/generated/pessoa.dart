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

abstract class Pessoa implements _i1.TableRow, _i1.ProtocolSerialization {
  Pessoa._({
    this.id,
    required this.nome,
    required this.altura,
    required this.idade,
    required this.email,
    required this.senha,
    required this.cpf,
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

  static final t = PessoaTable();

  static const db = PessoaRepository._();

  @override
  int? id;

  String nome;

  double altura;

  int idade;

  String email;

  String senha;

  String cpf;

  List<_i2.Peso>? historicoPeso;

  List<_i2.Dieta>? historicoDietas;

  List<_i2.Treino>? treinos;

  @override
  _i1.Table get table => t;

  Pessoa copyWith({
    int? id,
    String? nome,
    double? altura,
    int? idade,
    String? email,
    String? senha,
    String? cpf,
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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'altura': altura,
      'idade': idade,
      'email': email,
      'senha': senha,
      'cpf': cpf,
      if (historicoPeso != null)
        'historicoPeso':
            historicoPeso?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (historicoDietas != null)
        'historicoDietas':
            historicoDietas?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (treinos != null)
        'treinos': treinos?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static PessoaInclude include({
    _i2.PesoIncludeList? historicoPeso,
    _i2.DietaIncludeList? historicoDietas,
    _i2.TreinoIncludeList? treinos,
  }) {
    return PessoaInclude._(
      historicoPeso: historicoPeso,
      historicoDietas: historicoDietas,
      treinos: treinos,
    );
  }

  static PessoaIncludeList includeList({
    _i1.WhereExpressionBuilder<PessoaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PessoaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PessoaTable>? orderByList,
    PessoaInclude? include,
  }) {
    return PessoaIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Pessoa.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Pessoa.t),
      include: include,
    );
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

class PessoaTable extends _i1.Table {
  PessoaTable({super.tableRelation}) : super(tableName: 'pessoa') {
    nome = _i1.ColumnString(
      'nome',
      this,
    );
    altura = _i1.ColumnDouble(
      'altura',
      this,
    );
    idade = _i1.ColumnInt(
      'idade',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    senha = _i1.ColumnString(
      'senha',
      this,
    );
    cpf = _i1.ColumnString(
      'cpf',
      this,
    );
  }

  late final _i1.ColumnString nome;

  late final _i1.ColumnDouble altura;

  late final _i1.ColumnInt idade;

  late final _i1.ColumnString email;

  late final _i1.ColumnString senha;

  late final _i1.ColumnString cpf;

  _i2.PesoTable? ___historicoPeso;

  _i1.ManyRelation<_i2.PesoTable>? _historicoPeso;

  _i2.DietaTable? ___historicoDietas;

  _i1.ManyRelation<_i2.DietaTable>? _historicoDietas;

  _i2.TreinoTable? ___treinos;

  _i1.ManyRelation<_i2.TreinoTable>? _treinos;

  _i2.PesoTable get __historicoPeso {
    if (___historicoPeso != null) return ___historicoPeso!;
    ___historicoPeso = _i1.createRelationTable(
      relationFieldName: '__historicoPeso',
      field: Pessoa.t.id,
      foreignField: _i2.Peso.t.pessoaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PesoTable(tableRelation: foreignTableRelation),
    );
    return ___historicoPeso!;
  }

  _i2.DietaTable get __historicoDietas {
    if (___historicoDietas != null) return ___historicoDietas!;
    ___historicoDietas = _i1.createRelationTable(
      relationFieldName: '__historicoDietas',
      field: Pessoa.t.id,
      foreignField: _i2.Dieta.t.pessoaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DietaTable(tableRelation: foreignTableRelation),
    );
    return ___historicoDietas!;
  }

  _i2.TreinoTable get __treinos {
    if (___treinos != null) return ___treinos!;
    ___treinos = _i1.createRelationTable(
      relationFieldName: '__treinos',
      field: Pessoa.t.id,
      foreignField: _i2.Treino.t.pessoaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoTable(tableRelation: foreignTableRelation),
    );
    return ___treinos!;
  }

  _i1.ManyRelation<_i2.PesoTable> get historicoPeso {
    if (_historicoPeso != null) return _historicoPeso!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'historicoPeso',
      field: Pessoa.t.id,
      foreignField: _i2.Peso.t.pessoaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.PesoTable(tableRelation: foreignTableRelation),
    );
    _historicoPeso = _i1.ManyRelation<_i2.PesoTable>(
      tableWithRelations: relationTable,
      table: _i2.PesoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _historicoPeso!;
  }

  _i1.ManyRelation<_i2.DietaTable> get historicoDietas {
    if (_historicoDietas != null) return _historicoDietas!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'historicoDietas',
      field: Pessoa.t.id,
      foreignField: _i2.Dieta.t.pessoaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.DietaTable(tableRelation: foreignTableRelation),
    );
    _historicoDietas = _i1.ManyRelation<_i2.DietaTable>(
      tableWithRelations: relationTable,
      table: _i2.DietaTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _historicoDietas!;
  }

  _i1.ManyRelation<_i2.TreinoTable> get treinos {
    if (_treinos != null) return _treinos!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'treinos',
      field: Pessoa.t.id,
      foreignField: _i2.Treino.t.pessoaId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoTable(tableRelation: foreignTableRelation),
    );
    _treinos = _i1.ManyRelation<_i2.TreinoTable>(
      tableWithRelations: relationTable,
      table: _i2.TreinoTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _treinos!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        nome,
        altura,
        idade,
        email,
        senha,
        cpf,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'historicoPeso') {
      return __historicoPeso;
    }
    if (relationField == 'historicoDietas') {
      return __historicoDietas;
    }
    if (relationField == 'treinos') {
      return __treinos;
    }
    return null;
  }
}

class PessoaInclude extends _i1.IncludeObject {
  PessoaInclude._({
    _i2.PesoIncludeList? historicoPeso,
    _i2.DietaIncludeList? historicoDietas,
    _i2.TreinoIncludeList? treinos,
  }) {
    _historicoPeso = historicoPeso;
    _historicoDietas = historicoDietas;
    _treinos = treinos;
  }

  _i2.PesoIncludeList? _historicoPeso;

  _i2.DietaIncludeList? _historicoDietas;

  _i2.TreinoIncludeList? _treinos;

  @override
  Map<String, _i1.Include?> get includes => {
        'historicoPeso': _historicoPeso,
        'historicoDietas': _historicoDietas,
        'treinos': _treinos,
      };

  @override
  _i1.Table get table => Pessoa.t;
}

class PessoaIncludeList extends _i1.IncludeList {
  PessoaIncludeList._({
    _i1.WhereExpressionBuilder<PessoaTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Pessoa.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Pessoa.t;
}

class PessoaRepository {
  const PessoaRepository._();

  final attach = const PessoaAttachRepository._();

  final attachRow = const PessoaAttachRowRepository._();

  final detach = const PessoaDetachRepository._();

  final detachRow = const PessoaDetachRowRepository._();

  Future<List<Pessoa>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PessoaTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<PessoaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PessoaTable>? orderByList,
    _i1.Transaction? transaction,
    PessoaInclude? include,
  }) async {
    return session.db.find<Pessoa>(
      where: where?.call(Pessoa.t),
      orderBy: orderBy?.call(Pessoa.t),
      orderByList: orderByList?.call(Pessoa.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Pessoa?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PessoaTable>? where,
    int? offset,
    _i1.OrderByBuilder<PessoaTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<PessoaTable>? orderByList,
    _i1.Transaction? transaction,
    PessoaInclude? include,
  }) async {
    return session.db.findFirstRow<Pessoa>(
      where: where?.call(Pessoa.t),
      orderBy: orderBy?.call(Pessoa.t),
      orderByList: orderByList?.call(Pessoa.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Pessoa?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    PessoaInclude? include,
  }) async {
    return session.db.findById<Pessoa>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Pessoa>> insert(
    _i1.Session session,
    List<Pessoa> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Pessoa>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pessoa> insertRow(
    _i1.Session session,
    Pessoa row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Pessoa>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pessoa>> update(
    _i1.Session session,
    List<Pessoa> rows, {
    _i1.ColumnSelections<PessoaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Pessoa>(
      rows,
      columns: columns?.call(Pessoa.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pessoa> updateRow(
    _i1.Session session,
    Pessoa row, {
    _i1.ColumnSelections<PessoaTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Pessoa>(
      row,
      columns: columns?.call(Pessoa.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pessoa>> delete(
    _i1.Session session,
    List<Pessoa> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Pessoa>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Pessoa> deleteRow(
    _i1.Session session,
    Pessoa row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Pessoa>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Pessoa>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<PessoaTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Pessoa>(
      where: where(Pessoa.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<PessoaTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Pessoa>(
      where: where?.call(Pessoa.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class PessoaAttachRepository {
  const PessoaAttachRepository._();

  Future<void> historicoPeso(
    _i1.Session session,
    Pessoa pessoa,
    List<_i2.Peso> peso, {
    _i1.Transaction? transaction,
  }) async {
    if (peso.any((e) => e.id == null)) {
      throw ArgumentError.notNull('peso.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $peso = peso.map((e) => e.copyWith(pessoaId: pessoa.id)).toList();
    await session.db.update<_i2.Peso>(
      $peso,
      columns: [_i2.Peso.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> historicoDietas(
    _i1.Session session,
    Pessoa pessoa,
    List<_i2.Dieta> dieta, {
    _i1.Transaction? transaction,
  }) async {
    if (dieta.any((e) => e.id == null)) {
      throw ArgumentError.notNull('dieta.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $dieta = dieta.map((e) => e.copyWith(pessoaId: pessoa.id)).toList();
    await session.db.update<_i2.Dieta>(
      $dieta,
      columns: [_i2.Dieta.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> treinos(
    _i1.Session session,
    Pessoa pessoa,
    List<_i2.Treino> treino, {
    _i1.Transaction? transaction,
  }) async {
    if (treino.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treino.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $treino = treino.map((e) => e.copyWith(pessoaId: pessoa.id)).toList();
    await session.db.update<_i2.Treino>(
      $treino,
      columns: [_i2.Treino.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PessoaAttachRowRepository {
  const PessoaAttachRowRepository._();

  Future<void> historicoPeso(
    _i1.Session session,
    Pessoa pessoa,
    _i2.Peso peso, {
    _i1.Transaction? transaction,
  }) async {
    if (peso.id == null) {
      throw ArgumentError.notNull('peso.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $peso = peso.copyWith(pessoaId: pessoa.id);
    await session.db.updateRow<_i2.Peso>(
      $peso,
      columns: [_i2.Peso.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> historicoDietas(
    _i1.Session session,
    Pessoa pessoa,
    _i2.Dieta dieta, {
    _i1.Transaction? transaction,
  }) async {
    if (dieta.id == null) {
      throw ArgumentError.notNull('dieta.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $dieta = dieta.copyWith(pessoaId: pessoa.id);
    await session.db.updateRow<_i2.Dieta>(
      $dieta,
      columns: [_i2.Dieta.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }

  Future<void> treinos(
    _i1.Session session,
    Pessoa pessoa,
    _i2.Treino treino, {
    _i1.Transaction? transaction,
  }) async {
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }
    if (pessoa.id == null) {
      throw ArgumentError.notNull('pessoa.id');
    }

    var $treino = treino.copyWith(pessoaId: pessoa.id);
    await session.db.updateRow<_i2.Treino>(
      $treino,
      columns: [_i2.Treino.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PessoaDetachRepository {
  const PessoaDetachRepository._();

  Future<void> treinos(
    _i1.Session session,
    List<_i2.Treino> treino, {
    _i1.Transaction? transaction,
  }) async {
    if (treino.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treino = treino.map((e) => e.copyWith(pessoaId: null)).toList();
    await session.db.update<_i2.Treino>(
      $treino,
      columns: [_i2.Treino.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class PessoaDetachRowRepository {
  const PessoaDetachRowRepository._();

  Future<void> treinos(
    _i1.Session session,
    _i2.Treino treino, {
    _i1.Transaction? transaction,
  }) async {
    if (treino.id == null) {
      throw ArgumentError.notNull('treino.id');
    }

    var $treino = treino.copyWith(pessoaId: null);
    await session.db.updateRow<_i2.Treino>(
      $treino,
      columns: [_i2.Treino.t.pessoaId],
      transaction: transaction ?? session.transaction,
    );
  }
}

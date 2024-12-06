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

abstract class Exercicio implements _i1.TableRow, _i1.ProtocolSerialization {
  Exercicio._({
    this.id,
    required this.nome,
    required this.grupoMuscular,
    required this.descricao,
    required this.imagem,
    this.treinoExercicios,
  });

  factory Exercicio({
    int? id,
    required String nome,
    required String grupoMuscular,
    required String descricao,
    required String imagem,
    List<_i2.TreinoExercicio>? treinoExercicios,
  }) = _ExercicioImpl;

  factory Exercicio.fromJson(Map<String, dynamic> jsonSerialization) {
    return Exercicio(
      id: jsonSerialization['id'] as int?,
      nome: jsonSerialization['nome'] as String,
      grupoMuscular: jsonSerialization['grupoMuscular'] as String,
      descricao: jsonSerialization['descricao'] as String,
      imagem: jsonSerialization['imagem'] as String,
      treinoExercicios: (jsonSerialization['treinoExercicios'] as List?)
          ?.map(
              (e) => _i2.TreinoExercicio.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = ExercicioTable();

  static const db = ExercicioRepository._();

  @override
  int? id;

  String nome;

  String grupoMuscular;

  String descricao;

  String imagem;

  List<_i2.TreinoExercicio>? treinoExercicios;

  @override
  _i1.Table get table => t;

  Exercicio copyWith({
    int? id,
    String? nome,
    String? grupoMuscular,
    String? descricao,
    String? imagem,
    List<_i2.TreinoExercicio>? treinoExercicios,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'grupoMuscular': grupoMuscular,
      'descricao': descricao,
      'imagem': imagem,
      if (treinoExercicios != null)
        'treinoExercicios':
            treinoExercicios?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'nome': nome,
      'grupoMuscular': grupoMuscular,
      'descricao': descricao,
      'imagem': imagem,
      if (treinoExercicios != null)
        'treinoExercicios':
            treinoExercicios?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static ExercicioInclude include(
      {_i2.TreinoExercicioIncludeList? treinoExercicios}) {
    return ExercicioInclude._(treinoExercicios: treinoExercicios);
  }

  static ExercicioIncludeList includeList({
    _i1.WhereExpressionBuilder<ExercicioTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExercicioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExercicioTable>? orderByList,
    ExercicioInclude? include,
  }) {
    return ExercicioIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Exercicio.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Exercicio.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ExercicioImpl extends Exercicio {
  _ExercicioImpl({
    int? id,
    required String nome,
    required String grupoMuscular,
    required String descricao,
    required String imagem,
    List<_i2.TreinoExercicio>? treinoExercicios,
  }) : super._(
          id: id,
          nome: nome,
          grupoMuscular: grupoMuscular,
          descricao: descricao,
          imagem: imagem,
          treinoExercicios: treinoExercicios,
        );

  @override
  Exercicio copyWith({
    Object? id = _Undefined,
    String? nome,
    String? grupoMuscular,
    String? descricao,
    String? imagem,
    Object? treinoExercicios = _Undefined,
  }) {
    return Exercicio(
      id: id is int? ? id : this.id,
      nome: nome ?? this.nome,
      grupoMuscular: grupoMuscular ?? this.grupoMuscular,
      descricao: descricao ?? this.descricao,
      imagem: imagem ?? this.imagem,
      treinoExercicios: treinoExercicios is List<_i2.TreinoExercicio>?
          ? treinoExercicios
          : this.treinoExercicios?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class ExercicioTable extends _i1.Table {
  ExercicioTable({super.tableRelation}) : super(tableName: 'exercicio') {
    nome = _i1.ColumnString(
      'nome',
      this,
    );
    grupoMuscular = _i1.ColumnString(
      'grupoMuscular',
      this,
    );
    descricao = _i1.ColumnString(
      'descricao',
      this,
    );
    imagem = _i1.ColumnString(
      'imagem',
      this,
    );
  }

  late final _i1.ColumnString nome;

  late final _i1.ColumnString grupoMuscular;

  late final _i1.ColumnString descricao;

  late final _i1.ColumnString imagem;

  _i2.TreinoExercicioTable? ___treinoExercicios;

  _i1.ManyRelation<_i2.TreinoExercicioTable>? _treinoExercicios;

  _i2.TreinoExercicioTable get __treinoExercicios {
    if (___treinoExercicios != null) return ___treinoExercicios!;
    ___treinoExercicios = _i1.createRelationTable(
      relationFieldName: '__treinoExercicios',
      field: Exercicio.t.id,
      foreignField: _i2.TreinoExercicio.t.exercicioId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.TreinoExercicioTable(tableRelation: foreignTableRelation),
    );
    return ___treinoExercicios!;
  }

  _i1.ManyRelation<_i2.TreinoExercicioTable> get treinoExercicios {
    if (_treinoExercicios != null) return _treinoExercicios!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'treinoExercicios',
      field: Exercicio.t.id,
      foreignField: _i2.TreinoExercicio.t.exercicioId,
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

  @override
  List<_i1.Column> get columns => [
        id,
        nome,
        grupoMuscular,
        descricao,
        imagem,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'treinoExercicios') {
      return __treinoExercicios;
    }
    return null;
  }
}

class ExercicioInclude extends _i1.IncludeObject {
  ExercicioInclude._({_i2.TreinoExercicioIncludeList? treinoExercicios}) {
    _treinoExercicios = treinoExercicios;
  }

  _i2.TreinoExercicioIncludeList? _treinoExercicios;

  @override
  Map<String, _i1.Include?> get includes =>
      {'treinoExercicios': _treinoExercicios};

  @override
  _i1.Table get table => Exercicio.t;
}

class ExercicioIncludeList extends _i1.IncludeList {
  ExercicioIncludeList._({
    _i1.WhereExpressionBuilder<ExercicioTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Exercicio.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Exercicio.t;
}

class ExercicioRepository {
  const ExercicioRepository._();

  final attach = const ExercicioAttachRepository._();

  final attachRow = const ExercicioAttachRowRepository._();

  final detach = const ExercicioDetachRepository._();

  final detachRow = const ExercicioDetachRowRepository._();

  Future<List<Exercicio>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExercicioTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ExercicioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExercicioTable>? orderByList,
    _i1.Transaction? transaction,
    ExercicioInclude? include,
  }) async {
    return session.db.find<Exercicio>(
      where: where?.call(Exercicio.t),
      orderBy: orderBy?.call(Exercicio.t),
      orderByList: orderByList?.call(Exercicio.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Exercicio?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExercicioTable>? where,
    int? offset,
    _i1.OrderByBuilder<ExercicioTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ExercicioTable>? orderByList,
    _i1.Transaction? transaction,
    ExercicioInclude? include,
  }) async {
    return session.db.findFirstRow<Exercicio>(
      where: where?.call(Exercicio.t),
      orderBy: orderBy?.call(Exercicio.t),
      orderByList: orderByList?.call(Exercicio.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<Exercicio?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ExercicioInclude? include,
  }) async {
    return session.db.findById<Exercicio>(
      id,
      transaction: transaction ?? session.transaction,
      include: include,
    );
  }

  Future<List<Exercicio>> insert(
    _i1.Session session,
    List<Exercicio> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Exercicio>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Exercicio> insertRow(
    _i1.Session session,
    Exercicio row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Exercicio>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Exercicio>> update(
    _i1.Session session,
    List<Exercicio> rows, {
    _i1.ColumnSelections<ExercicioTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Exercicio>(
      rows,
      columns: columns?.call(Exercicio.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Exercicio> updateRow(
    _i1.Session session,
    Exercicio row, {
    _i1.ColumnSelections<ExercicioTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Exercicio>(
      row,
      columns: columns?.call(Exercicio.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Exercicio>> delete(
    _i1.Session session,
    List<Exercicio> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Exercicio>(
      rows,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<Exercicio> deleteRow(
    _i1.Session session,
    Exercicio row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Exercicio>(
      row,
      transaction: transaction ?? session.transaction,
    );
  }

  Future<List<Exercicio>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ExercicioTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Exercicio>(
      where: where(Exercicio.t),
      transaction: transaction ?? session.transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ExercicioTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Exercicio>(
      where: where?.call(Exercicio.t),
      limit: limit,
      transaction: transaction ?? session.transaction,
    );
  }
}

class ExercicioAttachRepository {
  const ExercicioAttachRepository._();

  Future<void> treinoExercicios(
    _i1.Session session,
    Exercicio exercicio,
    List<_i2.TreinoExercicio> treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }
    if (exercicio.id == null) {
      throw ArgumentError.notNull('exercicio.id');
    }

    var $treinoExercicio = treinoExercicio
        .map((e) => e.copyWith(exercicioId: exercicio.id))
        .toList();
    await session.db.update<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.exercicioId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class ExercicioAttachRowRepository {
  const ExercicioAttachRowRepository._();

  Future<void> treinoExercicios(
    _i1.Session session,
    Exercicio exercicio,
    _i2.TreinoExercicio treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }
    if (exercicio.id == null) {
      throw ArgumentError.notNull('exercicio.id');
    }

    var $treinoExercicio = treinoExercicio.copyWith(exercicioId: exercicio.id);
    await session.db.updateRow<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.exercicioId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class ExercicioDetachRepository {
  const ExercicioDetachRepository._();

  Future<void> treinoExercicios(
    _i1.Session session,
    List<_i2.TreinoExercicio> treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.any((e) => e.id == null)) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }

    var $treinoExercicio =
        treinoExercicio.map((e) => e.copyWith(exercicioId: null)).toList();
    await session.db.update<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.exercicioId],
      transaction: transaction ?? session.transaction,
    );
  }
}

class ExercicioDetachRowRepository {
  const ExercicioDetachRowRepository._();

  Future<void> treinoExercicios(
    _i1.Session session,
    _i2.TreinoExercicio treinoExercicio, {
    _i1.Transaction? transaction,
  }) async {
    if (treinoExercicio.id == null) {
      throw ArgumentError.notNull('treinoExercicio.id');
    }

    var $treinoExercicio = treinoExercicio.copyWith(exercicioId: null);
    await session.db.updateRow<_i2.TreinoExercicio>(
      $treinoExercicio,
      columns: [_i2.TreinoExercicio.t.exercicioId],
      transaction: transaction ?? session.transaction,
    );
  }
}

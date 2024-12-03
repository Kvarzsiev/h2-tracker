/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'dieta.dart' as _i3;
import 'exercicio.dart' as _i4;
import 'peso.dart' as _i5;
import 'pessoa.dart' as _i6;
import 'refeicao.dart' as _i7;
import 'treino.dart' as _i8;
import 'treino_exercicio.dart' as _i9;
import 'treino_exercicio_historico.dart' as _i10;
import 'treino_historico.dart' as _i11;
import 'protocol.dart' as _i12;
import 'package:h2_tracker_server/src/generated/exercicio.dart' as _i13;
import 'package:h2_tracker_server/src/generated/treino.dart' as _i14;
import 'package:h2_tracker_server/src/generated/treino_historico.dart' as _i15;
import 'package:h2_tracker_server/src/generated/treino_exercicio_historico.dart'
    as _i16;
export 'dieta.dart';
export 'exercicio.dart';
export 'peso.dart';
export 'pessoa.dart';
export 'refeicao.dart';
export 'treino.dart';
export 'treino_exercicio.dart';
export 'treino_exercicio_historico.dart';
export 'treino_historico.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'dieta',
      dartName: 'Dieta',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'dieta_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'caloriasMaximasDia',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'objetivo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dataFim',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'pessoaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'dieta_fk_0',
          columns: ['pessoaId'],
          referenceTable: 'pessoa',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'dieta_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'exercicio',
      dartName: 'Exercicio',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'exercicio_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nome',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'grupoMuscular',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'imagem',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'exercicio_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'peso',
      dartName: 'Peso',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'peso_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'peso',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'imc',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'dataPesagem',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'pessoaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'peso_fk_0',
          columns: ['pessoaId'],
          referenceTable: 'pessoa',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'peso_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'pessoa',
      dartName: 'Pessoa',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'pessoa_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nome',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'altura',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'idade',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'email',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'senha',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'cpf',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'sex',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'pessoa_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'refeicao',
      dartName: 'Refeicao',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'refeicao_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'calorias',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'proteinas',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dietaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'refeicao_fk_0',
          columns: ['dietaId'],
          referenceTable: 'dieta',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'refeicao_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'treino',
      dartName: 'Treino',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'treino_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'objetivo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'pessoaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'treino_fk_0',
          columns: ['pessoaId'],
          referenceTable: 'pessoa',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'treino_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'treino_exercicio',
      dartName: 'TreinoExercicio',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'treino_exercicio_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'repeticoes',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'series',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'treinoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'exercicioId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'treino_exercicio_fk_0',
          columns: ['treinoId'],
          referenceTable: 'treino',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'treino_exercicio_fk_1',
          columns: ['exercicioId'],
          referenceTable: 'exercicio',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'treino_exercicio_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'treino_exercicio_historico',
      dartName: 'TreinoExercicioHistorico',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault:
              'nextval(\'treino_exercicio_historico_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'progressao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'treinoExercicioId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'treino_exercicio_historico_fk_0',
          columns: ['treinoExercicioId'],
          referenceTable: 'treino_exercicio',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'treino_exercicio_historico_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'treino_historico',
      dartName: 'TreinoHistorico',
      schema: 'public',
      module: 'h2_tracker',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'treino_historico_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'horarioInicio',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'horarioFim',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'treinoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'treino_historico_fk_0',
          columns: ['treinoId'],
          referenceTable: 'treino',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'treino_historico_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i3.Dieta) {
      return _i3.Dieta.fromJson(data) as T;
    }
    if (t == _i4.Exercicio) {
      return _i4.Exercicio.fromJson(data) as T;
    }
    if (t == _i5.Peso) {
      return _i5.Peso.fromJson(data) as T;
    }
    if (t == _i6.Pessoa) {
      return _i6.Pessoa.fromJson(data) as T;
    }
    if (t == _i7.Refeicao) {
      return _i7.Refeicao.fromJson(data) as T;
    }
    if (t == _i8.Treino) {
      return _i8.Treino.fromJson(data) as T;
    }
    if (t == _i9.TreinoExercicio) {
      return _i9.TreinoExercicio.fromJson(data) as T;
    }
    if (t == _i10.TreinoExercicioHistorico) {
      return _i10.TreinoExercicioHistorico.fromJson(data) as T;
    }
    if (t == _i11.TreinoHistorico) {
      return _i11.TreinoHistorico.fromJson(data) as T;
    }
    if (t == _i1.getType<_i3.Dieta?>()) {
      return (data != null ? _i3.Dieta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Exercicio?>()) {
      return (data != null ? _i4.Exercicio.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Peso?>()) {
      return (data != null ? _i5.Peso.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Pessoa?>()) {
      return (data != null ? _i6.Pessoa.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Refeicao?>()) {
      return (data != null ? _i7.Refeicao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Treino?>()) {
      return (data != null ? _i8.Treino.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TreinoExercicio?>()) {
      return (data != null ? _i9.TreinoExercicio.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TreinoExercicioHistorico?>()) {
      return (data != null
          ? _i10.TreinoExercicioHistorico.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i11.TreinoHistorico?>()) {
      return (data != null ? _i11.TreinoHistorico.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i12.Refeicao>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Refeicao>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Peso>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Peso>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Dieta>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Dieta>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.Treino>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.Treino>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.TreinoExercicio>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.TreinoExercicio>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.TreinoHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.TreinoHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i12.TreinoExercicioHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i12.TreinoExercicioHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i13.Exercicio>) {
      return (data as List).map((e) => deserialize<_i13.Exercicio>(e)).toList()
          as dynamic;
    }
    if (t == List<_i14.Treino>) {
      return (data as List).map((e) => deserialize<_i14.Treino>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.TreinoHistorico>) {
      return (data as List)
          .map((e) => deserialize<_i15.TreinoHistorico>(e))
          .toList() as dynamic;
    }
    if (t == List<_i16.TreinoExercicioHistorico>) {
      return (data as List)
          .map((e) => deserialize<_i16.TreinoExercicioHistorico>(e))
          .toList() as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i3.Dieta) {
      return 'Dieta';
    }
    if (data is _i4.Exercicio) {
      return 'Exercicio';
    }
    if (data is _i5.Peso) {
      return 'Peso';
    }
    if (data is _i6.Pessoa) {
      return 'Pessoa';
    }
    if (data is _i7.Refeicao) {
      return 'Refeicao';
    }
    if (data is _i8.Treino) {
      return 'Treino';
    }
    if (data is _i9.TreinoExercicio) {
      return 'TreinoExercicio';
    }
    if (data is _i10.TreinoExercicioHistorico) {
      return 'TreinoExercicioHistorico';
    }
    if (data is _i11.TreinoHistorico) {
      return 'TreinoHistorico';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Dieta') {
      return deserialize<_i3.Dieta>(data['data']);
    }
    if (data['className'] == 'Exercicio') {
      return deserialize<_i4.Exercicio>(data['data']);
    }
    if (data['className'] == 'Peso') {
      return deserialize<_i5.Peso>(data['data']);
    }
    if (data['className'] == 'Pessoa') {
      return deserialize<_i6.Pessoa>(data['data']);
    }
    if (data['className'] == 'Refeicao') {
      return deserialize<_i7.Refeicao>(data['data']);
    }
    if (data['className'] == 'Treino') {
      return deserialize<_i8.Treino>(data['data']);
    }
    if (data['className'] == 'TreinoExercicio') {
      return deserialize<_i9.TreinoExercicio>(data['data']);
    }
    if (data['className'] == 'TreinoExercicioHistorico') {
      return deserialize<_i10.TreinoExercicioHistorico>(data['data']);
    }
    if (data['className'] == 'TreinoHistorico') {
      return deserialize<_i11.TreinoHistorico>(data['data']);
    }
    if (data['className'].startsWith('serverpod.')) {
      data['className'] = data['className'].substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i3.Dieta:
        return _i3.Dieta.t;
      case _i4.Exercicio:
        return _i4.Exercicio.t;
      case _i5.Peso:
        return _i5.Peso.t;
      case _i6.Pessoa:
        return _i6.Pessoa.t;
      case _i7.Refeicao:
        return _i7.Refeicao.t;
      case _i8.Treino:
        return _i8.Treino.t;
      case _i9.TreinoExercicio:
        return _i9.TreinoExercicio.t;
      case _i10.TreinoExercicioHistorico:
        return _i10.TreinoExercicioHistorico.t;
      case _i11.TreinoHistorico:
        return _i11.TreinoHistorico.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'h2_tracker';
}

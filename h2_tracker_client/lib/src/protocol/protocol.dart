/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'alimento.dart' as _i2;
import 'dieta.dart' as _i3;
import 'exercicio.dart' as _i4;
import 'opcao_alimento.dart' as _i5;
import 'peso.dart' as _i6;
import 'pessoa.dart' as _i7;
import 'refeicao.dart' as _i8;
import 'treino.dart' as _i9;
import 'treino_exercicio.dart' as _i10;
import 'treino_exercicio_historico.dart' as _i11;
import 'treino_historico.dart' as _i12;
import 'protocol.dart' as _i13;
import 'package:h2_tracker_client/src/protocol/dieta.dart' as _i14;
import 'package:h2_tracker_client/src/protocol/exercicio.dart' as _i15;
import 'package:h2_tracker_client/src/protocol/treino_exercicio_historico.dart'
    as _i16;
import 'package:h2_tracker_client/src/protocol/treino.dart' as _i17;
import 'package:h2_tracker_client/src/protocol/treino_historico.dart' as _i18;
export 'alimento.dart';
export 'dieta.dart';
export 'exercicio.dart';
export 'opcao_alimento.dart';
export 'peso.dart';
export 'pessoa.dart';
export 'refeicao.dart';
export 'treino.dart';
export 'treino_exercicio.dart';
export 'treino_exercicio_historico.dart';
export 'treino_historico.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Alimento) {
      return _i2.Alimento.fromJson(data) as T;
    }
    if (t == _i3.Dieta) {
      return _i3.Dieta.fromJson(data) as T;
    }
    if (t == _i4.Exercicio) {
      return _i4.Exercicio.fromJson(data) as T;
    }
    if (t == _i5.OpcaoAlimento) {
      return _i5.OpcaoAlimento.fromJson(data) as T;
    }
    if (t == _i6.Peso) {
      return _i6.Peso.fromJson(data) as T;
    }
    if (t == _i7.Pessoa) {
      return _i7.Pessoa.fromJson(data) as T;
    }
    if (t == _i8.Refeicao) {
      return _i8.Refeicao.fromJson(data) as T;
    }
    if (t == _i9.Treino) {
      return _i9.Treino.fromJson(data) as T;
    }
    if (t == _i10.TreinoExercicio) {
      return _i10.TreinoExercicio.fromJson(data) as T;
    }
    if (t == _i11.TreinoExercicioHistorico) {
      return _i11.TreinoExercicioHistorico.fromJson(data) as T;
    }
    if (t == _i12.TreinoHistorico) {
      return _i12.TreinoHistorico.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Alimento?>()) {
      return (data != null ? _i2.Alimento.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Dieta?>()) {
      return (data != null ? _i3.Dieta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Exercicio?>()) {
      return (data != null ? _i4.Exercicio.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.OpcaoAlimento?>()) {
      return (data != null ? _i5.OpcaoAlimento.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Peso?>()) {
      return (data != null ? _i6.Peso.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Pessoa?>()) {
      return (data != null ? _i7.Pessoa.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Refeicao?>()) {
      return (data != null ? _i8.Refeicao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.Treino?>()) {
      return (data != null ? _i9.Treino.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TreinoExercicio?>()) {
      return (data != null ? _i10.TreinoExercicio.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.TreinoExercicioHistorico?>()) {
      return (data != null
          ? _i11.TreinoExercicioHistorico.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i12.TreinoHistorico?>()) {
      return (data != null ? _i12.TreinoHistorico.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i13.OpcaoAlimento>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.OpcaoAlimento>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Refeicao>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Refeicao>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.TreinoExercicio>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.TreinoExercicio>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Peso>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Peso>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Dieta>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Dieta>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.Treino>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i13.Treino>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.OpcaoAlimento>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.OpcaoAlimento>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.TreinoExercicio>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.TreinoExercicio>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.TreinoHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.TreinoHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.TreinoExercicioHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.TreinoExercicioHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i13.TreinoExercicioHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i13.TreinoExercicioHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i14.Dieta>) {
      return (data as List).map((e) => deserialize<_i14.Dieta>(e)).toList()
          as dynamic;
    }
    if (t == List<_i15.Exercicio>) {
      return (data as List).map((e) => deserialize<_i15.Exercicio>(e)).toList()
          as dynamic;
    }
    if (t == List<_i16.TreinoExercicioHistorico>) {
      return (data as List)
          .map((e) => deserialize<_i16.TreinoExercicioHistorico>(e))
          .toList() as dynamic;
    }
    if (t == List<_i17.Treino>) {
      return (data as List).map((e) => deserialize<_i17.Treino>(e)).toList()
          as dynamic;
    }
    if (t == List<_i18.TreinoHistorico>) {
      return (data as List)
          .map((e) => deserialize<_i18.TreinoHistorico>(e))
          .toList() as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Alimento) {
      return 'Alimento';
    }
    if (data is _i3.Dieta) {
      return 'Dieta';
    }
    if (data is _i4.Exercicio) {
      return 'Exercicio';
    }
    if (data is _i5.OpcaoAlimento) {
      return 'OpcaoAlimento';
    }
    if (data is _i6.Peso) {
      return 'Peso';
    }
    if (data is _i7.Pessoa) {
      return 'Pessoa';
    }
    if (data is _i8.Refeicao) {
      return 'Refeicao';
    }
    if (data is _i9.Treino) {
      return 'Treino';
    }
    if (data is _i10.TreinoExercicio) {
      return 'TreinoExercicio';
    }
    if (data is _i11.TreinoExercicioHistorico) {
      return 'TreinoExercicioHistorico';
    }
    if (data is _i12.TreinoHistorico) {
      return 'TreinoHistorico';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Alimento') {
      return deserialize<_i2.Alimento>(data['data']);
    }
    if (data['className'] == 'Dieta') {
      return deserialize<_i3.Dieta>(data['data']);
    }
    if (data['className'] == 'Exercicio') {
      return deserialize<_i4.Exercicio>(data['data']);
    }
    if (data['className'] == 'OpcaoAlimento') {
      return deserialize<_i5.OpcaoAlimento>(data['data']);
    }
    if (data['className'] == 'Peso') {
      return deserialize<_i6.Peso>(data['data']);
    }
    if (data['className'] == 'Pessoa') {
      return deserialize<_i7.Pessoa>(data['data']);
    }
    if (data['className'] == 'Refeicao') {
      return deserialize<_i8.Refeicao>(data['data']);
    }
    if (data['className'] == 'Treino') {
      return deserialize<_i9.Treino>(data['data']);
    }
    if (data['className'] == 'TreinoExercicio') {
      return deserialize<_i10.TreinoExercicio>(data['data']);
    }
    if (data['className'] == 'TreinoExercicioHistorico') {
      return deserialize<_i11.TreinoExercicioHistorico>(data['data']);
    }
    if (data['className'] == 'TreinoHistorico') {
      return deserialize<_i12.TreinoHistorico>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

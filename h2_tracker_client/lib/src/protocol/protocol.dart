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
import 'dieta.dart' as _i2;
import 'exercicio.dart' as _i3;
import 'peso.dart' as _i4;
import 'pessoa.dart' as _i5;
import 'refeicao.dart' as _i6;
import 'treino.dart' as _i7;
import 'treino_exercicio.dart' as _i8;
import 'treino_exercicio_historico.dart' as _i9;
import 'treino_historico.dart' as _i10;
import 'protocol.dart' as _i11;
import 'package:h2_tracker_client/src/protocol/exercicio.dart' as _i12;
import 'package:h2_tracker_client/src/protocol/treino_exercicio.dart' as _i13;
import 'package:h2_tracker_client/src/protocol/treino.dart' as _i14;
export 'dieta.dart';
export 'exercicio.dart';
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
    if (t == _i2.Dieta) {
      return _i2.Dieta.fromJson(data) as T;
    }
    if (t == _i3.Exercicio) {
      return _i3.Exercicio.fromJson(data) as T;
    }
    if (t == _i4.Peso) {
      return _i4.Peso.fromJson(data) as T;
    }
    if (t == _i5.Pessoa) {
      return _i5.Pessoa.fromJson(data) as T;
    }
    if (t == _i6.Refeicao) {
      return _i6.Refeicao.fromJson(data) as T;
    }
    if (t == _i7.Treino) {
      return _i7.Treino.fromJson(data) as T;
    }
    if (t == _i8.TreinoExercicio) {
      return _i8.TreinoExercicio.fromJson(data) as T;
    }
    if (t == _i9.TreinoExercicioHistorico) {
      return _i9.TreinoExercicioHistorico.fromJson(data) as T;
    }
    if (t == _i10.TreinoHistorico) {
      return _i10.TreinoHistorico.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Dieta?>()) {
      return (data != null ? _i2.Dieta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Exercicio?>()) {
      return (data != null ? _i3.Exercicio.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Peso?>()) {
      return (data != null ? _i4.Peso.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Pessoa?>()) {
      return (data != null ? _i5.Pessoa.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Refeicao?>()) {
      return (data != null ? _i6.Refeicao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Treino?>()) {
      return (data != null ? _i7.Treino.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.TreinoExercicio?>()) {
      return (data != null ? _i8.TreinoExercicio.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.TreinoExercicioHistorico?>()) {
      return (data != null ? _i9.TreinoExercicioHistorico.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i10.TreinoHistorico?>()) {
      return (data != null ? _i10.TreinoHistorico.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i11.Refeicao>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Refeicao>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.Peso>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Peso>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.Dieta>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Dieta>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.Treino>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i11.Treino>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.TreinoExercicio>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.TreinoExercicio>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.TreinoHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.TreinoHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i11.TreinoExercicioHistorico>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.TreinoExercicioHistorico>(e))
              .toList()
          : null) as dynamic;
    }
    if (t == List<_i12.Exercicio>) {
      return (data as List).map((e) => deserialize<_i12.Exercicio>(e)).toList()
          as dynamic;
    }
    if (t == List<_i13.TreinoExercicio>) {
      return (data as List)
          .map((e) => deserialize<_i13.TreinoExercicio>(e))
          .toList() as dynamic;
    }
    if (t == List<_i14.Treino>) {
      return (data as List).map((e) => deserialize<_i14.Treino>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Dieta) {
      return 'Dieta';
    }
    if (data is _i3.Exercicio) {
      return 'Exercicio';
    }
    if (data is _i4.Peso) {
      return 'Peso';
    }
    if (data is _i5.Pessoa) {
      return 'Pessoa';
    }
    if (data is _i6.Refeicao) {
      return 'Refeicao';
    }
    if (data is _i7.Treino) {
      return 'Treino';
    }
    if (data is _i8.TreinoExercicio) {
      return 'TreinoExercicio';
    }
    if (data is _i9.TreinoExercicioHistorico) {
      return 'TreinoExercicioHistorico';
    }
    if (data is _i10.TreinoHistorico) {
      return 'TreinoHistorico';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'Dieta') {
      return deserialize<_i2.Dieta>(data['data']);
    }
    if (data['className'] == 'Exercicio') {
      return deserialize<_i3.Exercicio>(data['data']);
    }
    if (data['className'] == 'Peso') {
      return deserialize<_i4.Peso>(data['data']);
    }
    if (data['className'] == 'Pessoa') {
      return deserialize<_i5.Pessoa>(data['data']);
    }
    if (data['className'] == 'Refeicao') {
      return deserialize<_i6.Refeicao>(data['data']);
    }
    if (data['className'] == 'Treino') {
      return deserialize<_i7.Treino>(data['data']);
    }
    if (data['className'] == 'TreinoExercicio') {
      return deserialize<_i8.TreinoExercicio>(data['data']);
    }
    if (data['className'] == 'TreinoExercicioHistorico') {
      return deserialize<_i9.TreinoExercicioHistorico>(data['data']);
    }
    if (data['className'] == 'TreinoHistorico') {
      return deserialize<_i10.TreinoHistorico>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}

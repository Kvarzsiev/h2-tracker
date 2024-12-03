import 'dart:async';

import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/basic_form_field.dart';
import 'package:h2_tracker_flutter/components/charts/train_progression_line_chart.dart';
import 'package:h2_tracker_flutter/components/charts/weigth_bar_chart.dart';
import 'package:h2_tracker_flutter/extensions/date.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class DataMainView extends StatefulWidget {
  const DataMainView({super.key});

  @override
  DataMainViewState createState() => DataMainViewState();
}

class DataMainViewState extends State<DataMainView> {
  final UserStateService _userState = UserStateService();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Peso? _lastWeightIn;

  Future<void> loadData() async {
    await _userState.refresh();

    if (_userState.user?.historicoPeso?.first != null) {
      setState(() {
        _lastWeightIn = _userState.user!.historicoPeso!.first;
      });

      _weightController.text = _lastWeightIn!.peso.toString();
    }

    _sexController.text = _userState.user!.sex;
    _ageController.text = _userState.user!.idade.toString();
    _heightController.text = _userState.user!.altura.toString();
  }

  final _ageController = TextEditingController();
  bool _editingAge = false;
  final _sexController = TextEditingController();
  bool _editingSex = false;
  final _weightController = TextEditingController();
  bool _editingWeight = false;
  final _heightController = TextEditingController();
  bool _editingHeight = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width * .24,
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: _physiologicData(theme),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text(
                            'Frequência de Treinos',
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 24),
                          ),
                          Row()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width * .04,
            ),
            SizedBox(
              width: size.width * .48,
              child: Column(
                children: [
                  _weightHistory(theme),
                  const SizedBox(
                    height: 24,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Text('Progressão de Exercícios',
                              style: theme.textTheme.titleMedium!
                                  .copyWith(fontSize: 18)),
                          if (_userState.user?.historicoPeso != null)
                            AspectRatio(
                              aspectRatio: 2,
                              child: TrainProgressionLineChart(),
                            ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Card _weightHistory(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Histórico de Peso',
              style: theme.textTheme.titleMedium!.copyWith(fontSize: 18),
            ),
            if (_userState.user?.historicoPeso != null)
              AspectRatio(
                aspectRatio: 3,
                child: WeightBarChart(
                  weightHistory:
                      _userState.user!.historicoPeso!.reversed.toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Column _physiologicData(ThemeData theme) {
    return Column(
      children: [
        Text(
          'Dados Fisiológicos',
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 32),
        ),
        const SizedBox(
          height: 8,
        ),
        if (_userState.user?.historicoDietas != null)
          Text(
            'Objetivo atual: ${_userState.user?.historicoDietas!.first.objetivo.toReadableTitle()}',
            style: theme.textTheme.titleMedium!.copyWith(fontSize: 15),
          ),
        const SizedBox(
          height: 24,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: BasicFormField(
                label: 'Idade',
                controller: _ageController,
                textInputType: InputType.age,
                enabled: _editingAge,
              ),
            ),
            if (!_editingAge)
              _editSendButton(() {
                setState(() {
                  _editingAge = true;
                });
                Timer(const Duration(seconds: 10), () {
                  setState(() {
                    _editingAge = false;
                  });
                });
              }, Icons.edit)
            else
              _editSendButton(() async {
                final age = int.tryParse(
                  _ageController.text,
                );
                final user = _userState.user;
                if (age != null && user != null) {
                  user.idade = age;
                  await client.pessoa.update(user);
                  await _updateDiet(user);
                  await loadData();

                  setState(() {
                    _editingHeight = false;
                  });
                }
              }, Icons.send),
            Expanded(
              child: BasicFormField(
                label: 'Sexo',
                controller: _sexController,
                textInputType: InputType.sex,
                enabled: _editingSex,
              ),
            ),
            if (!_editingAge)
              _editSendButton(() {
                setState(() {
                  _editingSex = true;
                });
                Timer(const Duration(seconds: 10), () {
                  setState(() {
                    _editingSex = false;
                  });
                });
              }, Icons.edit)
            else
              _editSendButton(() async {
                final sex = _sexController.text;
                final user = _userState.user;
                if (user != null) {
                  user.sex = sex;
                  await client.pessoa.update(user);
                  await _updateDiet(user);
                  await loadData();

                  setState(() {
                    _editingSex = false;
                  });
                }
              }, Icons.send)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: BasicFormField(
                label: 'Altura',
                controller: _heightController,
                textInputType: InputType.height,
                enabled: _editingHeight,
              ),
            ),
            if (!_editingHeight)
              _editSendButton(() {
                setState(() {
                  _editingHeight = true;
                });
                Timer(const Duration(seconds: 10), () {
                  setState(() {
                    _editingHeight = false;
                  });
                });
              }, Icons.edit)
            else
              _editSendButton(() async {
                final height = double.tryParse(
                  _heightController.text.replaceAll(',', '.'),
                );
                final user = _userState.user;
                if (height != null && user != null) {
                  user.altura = height;
                  await client.pessoa.update(user);
                  await client.peso.updateHeight(user.id!, height);
                  await _updateDiet(user);
                  await loadData();

                  setState(() {
                    _editingHeight = false;
                  });
                }
              }, Icons.send)
          ],
        ),
        if (_lastWeightIn != null)
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: BasicFormField(
                  label:
                      'Peso (Kg) ${_lastWeightIn!.dataPesagem.formatToPtBr(PtBrFormat.short)}',
                  labelTrailing: 'IMC ${_lastWeightIn!.imc.toStringAsFixed(2)}',
                  controller: _weightController,
                  textInputType: InputType.weigth,
                  enabled: _editingWeight,
                ),
              ),
              if (!_editingWeight)
                _editSendButton(() {
                  setState(() {
                    _editingWeight = true;
                  });
                  Timer(const Duration(seconds: 10), () {
                    setState(() {
                      _editingWeight = false;
                    });
                  });
                }, Icons.edit)
              else
                _editSendButton(() async {
                  final weight = double.tryParse(
                    _weightController.text.replaceAll(',', '.'),
                  );
                  final user = _userState.user;
                  if (weight != null && user != null) {
                    final newPeso = Peso(
                        imc: 0,
                        peso: weight,
                        dataPesagem: DateTime.now(),
                        pessoaId: user.id!);

                    await client.peso.insert(newPeso, user.altura);
                    await loadData();

                    setState(() {
                      _editingWeight = false;
                    });
                  }
                }, Icons.send)
            ],
          ),
      ],
    );
  }

  Future<void> _updateDiet(Pessoa user) async {
    if (user.historicoDietas != null && user.historicoDietas!.isNotEmpty) {
      await client.dieta.update(user.historicoDietas!.first,
          user.historicoPeso!.first.peso, user.altura, user.idade, user.sex);
    }
  }

  IconButton _editSendButton(void Function() pressed, IconData icon) {
    return IconButton(
      onPressed: pressed,
      icon: Padding(
        padding: const EdgeInsets.all(4),
        child: Icon(
          icon,
          color: Colors.blue,
        ),
      ),
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // Rectangular shape
          ),
        ),
        overlayColor: WidgetStateProperty.resolveWith<Color?>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return Colors.blue.withOpacity(0.2); // Splash color
            }
            if (states.contains(WidgetState.hovered)) {
              return Colors.blue.withOpacity(0.1); // Splash color
            }
            return null; // Default
          },
        ),
      ),
    );
  }
}

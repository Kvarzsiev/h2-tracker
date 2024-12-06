import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/diet_card.dart';
import 'package:h2_tracker_flutter/components/select_goal.dart';
import 'package:h2_tracker_flutter/extensions/color.dart';
import 'package:h2_tracker_flutter/extensions/date.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class DietMainView extends StatefulWidget {
  const DietMainView({super.key});

  @override
  DietMainViewState createState() => DietMainViewState();
}

class DietMainViewState extends State<DietMainView> {
  final UserStateService _userState = UserStateService();

  final _dateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> loadData() async {
    await _userState.refresh();
    final user = _userState.user;

    setState(() {
      _dateController.text = _selectedDate.formatToPtBr(PtBrFormat.short);
    });

    if (user != null) {
      final diets = await client.dieta.readUserDiets(user.id!);

      setState(() {
        _diets = diets;
      });
    }
  }

  List<Dieta> _diets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 4,
        children: [
          IconButton(
            onPressed: () {
              _showInsertDialog();
            },
            hoverColor: Colors.blue.withOpacity(.06),
            highlightColor: Colors.blue.lighten(30).withOpacity(.1),
            icon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Colors.blue.darken(20),
                    Colors.blue.lighten(30),
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(bounds);
              },
              child: const Icon(
                Icons.add_circle,
                size: 160,
              ),
            ),
          ),
          ..._diets.map((diet) => DietCard(
              diet: diet,
              onTap: () {
                _showViewDialog(diet);
              }))
        ],
      ),
    );
  }

  String _getImage(String dietFocus) {
    switch (dietFocus) {
      case 'PERDA_DE_PESO':
        {
          return 'assets/images/lean.png';
        }

      case 'GANHO_DE_PESO':
        {
          return 'assets/images/gain.jpg';
        }

      case 'GANHO_DE_MASSA_MAGRA':
        {
          return 'assets/images/muscle.png';
        }

      case 'MANUTENCAO_DE_PESO':
        {
          return 'assets/images/maintain.jpg';
        }
      default:
        return 'assets/images/maintain.jpg';
    }
  }

  void _showViewDialog(Dieta diet) {
    final size = MediaQuery.sizeOf(context);

    showDialog<TreinoExercicio>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              '${diet.objetivo.toReadableTitle()} - ${diet.dataFim.formatToPtBr(PtBrFormat.short)}'),
          content: SizedBox(
            height: size.height * .7,
            width: size.width * .7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${diet.caloriasMaximasDia} Kcal Diárias',
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 17),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  diet.descricao,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 17),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Divider(),
                const SizedBox(
                  height: 16,
                ),
                ...diet.refeicoes!.asMap().entries.map(
                      (refeicao) => Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Refeição ${refeicao.key + 1}',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                      ),
                                      const Spacer(),
                                      Text(
                                        '${refeicao.value.calorias} Kcal',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        '${refeicao.value.proteinas} g de Proteína',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            _foodOptionCard(context,
                                refeicao.value.opcoesAlimentos!, 'Proteína'),
                            _foodOptionCard(context,
                                refeicao.value.opcoesAlimentos!, 'Carboidrato'),
                            _foodOptionCard(
                                context,
                                refeicao.value.opcoesAlimentos!,
                                'Acompanhamento'),
                          ],
                        ),
                      ),
                    )
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 24),
              ),
              child: const Text(
                'Voltar',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Expanded _foodOptionCard(
    BuildContext context,
    List<OpcaoAlimento> opcoesAlimentos,
    String tipoAlimento,
  ) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'Opções $tipoAlimento',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                ...opcoesAlimentos
                    .where((el) => el.alimento!.tipo == tipoAlimento)
                    .map(
                      (opcao) => Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${opcao.alimento!.descricao} - ${opcao.quantidade}g',
                          style:
                              Theme.of(context).textTheme.labelMedium!.copyWith(
                                    fontSize: 16,
                                  ),
                        ),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showInsertDialog() {
    final size = MediaQuery.sizeOf(context);

    showDialog<TreinoExercicio>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Nova Dieta'),
          content: SizedBox(
            height: size.height * .7,
            width: size.width * .7,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SelectGoal(updateValue: _updateDropdownValue),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    controller: _dateController,
                    decoration: const InputDecoration(
                      labelText: 'Selecione uma Data',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  '*Uma nova dieta será gerada automaticamente com base nos seus dados. Ela será relativamente genérica, mas dentro do seu perfil e deve ser tomada como uma sugestão ou guia.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 24),
              ),
              child: const Text(
                'Cancelar',
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(fontSize: 24),
              ),
              child: const Text(
                'Salvar',
              ),
              onPressed: () async {
                final user = _userState.user;

                if (user != null) {
                  final dieta = Dieta(
                    dataFim: _selectedDate,
                    pessoaId: user.id!,
                    caloriasMaximasDia: 0,
                    objetivo: dropdownValue,
                    ativa: true,
                    descricao:
                        'Dieta genérica com foco em: ${dropdownValue.toReadableTitle()} (não substitui a consulta com um profissional).',
                  );

                  await client.dieta.insert(
                    dieta,
                    user.historicoPeso!.first.peso,
                    user.altura,
                    user.idade,
                    user.sex,
                  );

                  await loadData();
                }

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime.now(), // Minimum date
      lastDate: DateTime(2100), // Maximum date
    );

    if (picked != null) {
      setState(() {
        _dateController.text = picked.formatToPtBr(PtBrFormat.short);
        _selectedDate = picked;
      });
    }
  }

  String dropdownValue = 'PERDA_DE_PESO';

  void _updateDropdownValue(String newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }
}

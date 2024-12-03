import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/extensions/show_snack_bar.dart';
import 'package:h2_tracker_flutter/extensions/string.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class UserTrainingsView extends StatefulWidget {
  const UserTrainingsView({super.key, required this.navigateToRailIndex});

  final void Function(int, dynamic) navigateToRailIndex;

  @override
  UserTrainingsViewState createState() => UserTrainingsViewState();
}

class UserTrainingsViewState extends State<UserTrainingsView> {
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _loading = true;
    });
    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  final UserStateService _userState = UserStateService();

  List<Treino> _treinos = [];

  Future<void> loadData() async {
    final treinos = await client.pessoa.readUserTrainings(_userState.user!.id!);

    setState(() {
      _treinos = treinos;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _loading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.blue,
          ))
        : Expanded(
            child: _treinos.isNotEmpty
                ? ListView(
                    children: _treinos
                        .map((treino) => Padding(
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () =>
                                    widget.navigateToRailIndex(1, treino),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(treino.descricao),
                                    ),
                                    const SizedBox(
                                      width: 32,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        treino.objetivo.toReadableTitle(),
                                      ),
                                    ),
                                    Expanded(
                                        child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: IconButton(
                                              onPressed: () async {
                                                try {
                                                  setState(() {
                                                    _loading = true;
                                                  });
                                                  await client.treino
                                                      .delete(treino);
                                                  showSnackBar(
                                                      context: context,
                                                      message:
                                                          'Treino removido!',
                                                      status: SnackBarStatus
                                                          .success);

                                                  loadData();
                                                } catch (err) {
                                                  showSnackBar(
                                                      context: context,
                                                      message:
                                                          'Erro ao remover treino!',
                                                      status:
                                                          SnackBarStatus.error);

                                                  setState(() {
                                                    _loading = false;
                                                  });
                                                }
                                              },
                                              color: Colors.red,
                                              hoverColor: Colors.redAccent
                                                  .withOpacity(.1),
                                              icon: const Icon(
                                                Icons.delete_rounded,
                                              )),
                                        ),
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Que tal começar a treinar?',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 32),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: FilledButton.icon(
                            onPressed: () =>
                                widget.navigateToRailIndex(1, null),
                            label: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Criar novo Treino',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            icon: const Icon(Icons.add)),
                      )
                    ],
                  ));
  }
}

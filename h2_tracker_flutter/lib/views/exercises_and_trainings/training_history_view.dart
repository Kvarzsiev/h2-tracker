import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class TrainingHistoryView extends StatefulWidget {
  const TrainingHistoryView({super.key, required this.navigateToRailIndex});

  final void Function(int, dynamic) navigateToRailIndex;

  @override
  TrainingHistoryViewState createState() => TrainingHistoryViewState();
}

class TrainingHistoryViewState extends State<TrainingHistoryView> {
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
    //final treinos = await client.pessoa.readUserTrainings(_userState.user!.id!);
    //
    setState(() {
      //  _treinos = treinos;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _loading
        ? const Center(
            child: CircularProgressIndicator(
            color: Colors.blue,
          ))
        : Expanded(
            child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Histórico',
                  style: theme.textTheme.titleLarge!.copyWith(fontSize: 32),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Container(
                  height: 64,
                  width: 128,
                  color: Colors.blue,
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
              Expanded(child: ListView())
            ],
          ));
  }
}

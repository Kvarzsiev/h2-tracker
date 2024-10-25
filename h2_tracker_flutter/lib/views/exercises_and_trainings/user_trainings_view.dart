import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/main.dart';

class UserTrainingsView extends StatefulWidget {
  const UserTrainingsView({super.key, this.trainingId});

  final int? trainingId;

  @override
  UserTrainingsViewState createState() => UserTrainingsViewState();
}

class UserTrainingsViewState extends State<UserTrainingsView> {
  @override
  void initState() {
    super.initState();

    loadData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Exercicio> _exercises = [];

  Future<void> loadData() async {
    final exercises = await client.exercicio.read();

    setState(() {
      _exercises = exercises;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [],
    );
  }
}

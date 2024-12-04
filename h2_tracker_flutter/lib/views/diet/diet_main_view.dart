import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/components/diet_card.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class DietMainView extends StatefulWidget {
  const DietMainView({super.key});

  @override
  DietMainViewState createState() => DietMainViewState();
}

class DietMainViewState extends State<DietMainView> {
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

  Future<void> loadData() async {
    final user = _userState.user;
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
          children: _diets
              .map((exercise) => DietCard(diet: exercise, onTap: () {}))
              .toList()),
    );
  }
}

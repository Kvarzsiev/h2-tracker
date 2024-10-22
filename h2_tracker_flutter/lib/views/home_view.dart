import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    final pessoaLogada = ModalRoute.of(context)!.settings.arguments as Pessoa;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: AppBar(
          backgroundColor: Colors.lightBlue[400],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bem-vindo, ${pessoaLogada.nome}!',
                style: const TextStyle(color: Colors.white),
              ),
              Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[400],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/treino');
                    },
                    child: const Text('Treino'),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue[400],
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/dieta');
                    },
                    child: const Text('Dieta'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
      body: Center(),
    );
  }
}

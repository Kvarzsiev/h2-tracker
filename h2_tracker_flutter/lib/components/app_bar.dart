import 'package:flutter/material.dart';
import 'package:h2_tracker_flutter/components/highlight.dart';
import 'package:h2_tracker_flutter/extensions/color.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class H2AppBar extends StatefulWidget implements PreferredSizeWidget {
  const H2AppBar({super.key, required this.updatePage});

  final void Function(int index) updatePage;

  @override
  H2AppBarState createState() => H2AppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(108);
}

class H2AppBarState extends State<H2AppBar> {
  int index = 0;

  final _userStateService = UserStateService();

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.lighten(20), Colors.blue.darken(20)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Healthy Habits Tracker',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Bem Vindo(a) ${_userStateService.user?.nome}!',
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .64,
              child: Row(
                children: [
                  Highlight(
                    isHighlighted: index == 0,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .16,
                      height: 108,
                      child: TextButton.icon(
                        autofocus: true,
                        onPressed: () {
                          setState(() {
                            index = 0;
                          });
                          widget.updatePage(0);
                        },
                        label: const Text(
                          'Exercícios e Treinos',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.fitness_center_rounded),
                      ),
                    ),
                  ),
                  Highlight(
                    isHighlighted: index == 1,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .16,
                      height: 108,
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            index = 1;
                          });
                          widget.updatePage(1);
                        },
                        label: const Text(
                          'Dieta e Alimentação',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.restaurant_rounded),
                      ),
                    ),
                  ),
                  Highlight(
                    isHighlighted: index == 2,
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * .16,
                      height: 108,
                      child: TextButton.icon(
                        onPressed: () {
                          setState(() {
                            index = 2;
                          });
                          widget.updatePage(2);
                        },
                        label: const Text(
                          'Dados e Estatísticas',
                          style: TextStyle(color: Colors.white),
                        ),
                        icon: const Icon(Icons.show_chart_rounded),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text(
                'Sair',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:h2_tracker_flutter/components/app_bar.dart';
import 'package:h2_tracker_flutter/views/data/data_main_view.dart';
import 'package:h2_tracker_flutter/views/diet/diet_main_view.dart';
import 'package:h2_tracker_flutter/views/exercises_and_trainings/exercises_main_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final PageController _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  void _updateCurrentPage(int newIndex) {
    _pageViewController.animateToPage(
      newIndex,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: H2AppBar(updatePage: _updateCurrentPage),
      body: PageView(
        controller: _pageViewController,
        children: const <Widget>[
          ExercisesMainView(),
          DietMainView(),
          DataMainView()
        ],
      ),
    );
  }
}

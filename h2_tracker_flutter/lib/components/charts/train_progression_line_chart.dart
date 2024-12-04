import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/extensions/color.dart';
import 'package:h2_tracker_flutter/extensions/date.dart';
import 'package:h2_tracker_flutter/main.dart';
import 'package:h2_tracker_flutter/service/user_state_service.dart';

class TrainProgressionLineChart extends StatefulWidget {
  const TrainProgressionLineChart({
    super.key,
  });

  @override
  State<TrainProgressionLineChart> createState() =>
      _TrainProgressionLineChartState();
}

class _TrainProgressionLineChartState extends State<TrainProgressionLineChart> {
  List<Color> gradientColors = [
    Colors.blue.darken(20),
    Colors.blue.lighten(30),
  ];

  final UserStateService _userState = UserStateService();

  List<TreinoExercicioHistorico> _exerciseHistory = [];
  List<Exercicio> _exercises = [];
  Exercicio? _selectedExercise;
  final TextEditingController _typeAheadController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  Future<void> _loadData() async {
    final exercises = await client.exercicio.read();

    setState(() {
      _exercises = exercises;
    });

    final user = _userState.user;
    final selectedExercise = _selectedExercise;
    if (user != null && selectedExercise != null) {
      final exerciseHistory = await client.treinoExercicioHistorico
          .readUserTrainHistory(user.id!, selectedExercise.id!);

      setState(() {
        _exerciseHistory = exerciseHistory;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TypeAheadField<Exercicio>(
            itemBuilder: (context, exercise) {
              return ListTile(
                title: Text(exercise.nome),
                subtitle: Text(exercise.grupoMuscular),
              );
            },
            controller: _typeAheadController,
            onSelected: (exercise) async {
              setState(() {
                _selectedExercise = exercise;
                _typeAheadController.text = exercise.nome;
              });
              await _loadData();
            },
            suggestionsCallback: (searchVal) {
              print('SEARCHVAL ${searchVal}');
              return _exercises
                  .where(
                    (element) => element.nome.toLowerCase().contains(
                          searchVal.toLowerCase(),
                        ),
                  )
                  .toList();
            }),
        AspectRatio(
          aspectRatio: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              right: 18,
              left: 12,
              top: 24,
              bottom: 12,
            ),
            child: _exerciseHistory.isNotEmpty
                ? LineChart(
                    mainData(),
                  )
                : Center(
                    child: Text(
                      _selectedExercise == null
                          ? 'Selecione um Exercício!'
                          : 'Nenhum histórico encontrado para este exercício.',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );
    final text = Text(
        _exerciseHistory[value.toInt()]
            .treinoHistorico!
            .horarioFim
            .formatToPtBr(PtBrFormat.shortest),
        style: style);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = '${value.toInt()}kg';

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.cyan,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: leftTitleWidgets,
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (_) => Colors.blueGrey.withOpacity(.1),
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: _exerciseHistory
              .asMap()
              .entries
              .map((exercise) => FlSpot(exercise.key.toDouble(),
                  double.parse(exercise.value.progressao)))
              .toList(),
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
}

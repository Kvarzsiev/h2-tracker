import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:h2_tracker_client/h2_tracker_client.dart';
import 'package:h2_tracker_flutter/extensions/color.dart';
import 'package:h2_tracker_flutter/extensions/date.dart';

class WeightBarChart extends StatefulWidget {
  const WeightBarChart({super.key, required this.weightHistory});

  final List<Peso> weightHistory;

  @override
  WeightBarChartState createState() => WeightBarChartState();
}

class WeightBarChartState extends State<WeightBarChart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: 150,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: Colors.blue.darken(20),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text = widget.weightHistory[value.toInt()].dataPesagem
        .formatToPtBr(PtBrFormat.shortest);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          Colors.blue.darken(20),
          Colors.blue.lighten(20),
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  List<BarChartGroupData> get barGroups => widget.weightHistory
      .asMap()
      .entries
      .map((weightIn) => BarChartGroupData(
            x: weightIn.key,
            barRods: [
              BarChartRodData(
                toY: weightIn.value.peso,
                gradient: _barsGradient,
              )
            ],
            showingTooltipIndicators: [0],
          ))
      .toList();
}

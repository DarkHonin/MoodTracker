import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/models/mood.dart';
import 'package:mood_tracker/models/mood_point.dart';

class MoodPointChart extends StatelessWidget {
  final Mood? mood;

  const MoodPointChart(
    this.mood, {
    Key? key,
  }) : super(key: key);

  Widget _generateChart() {
    return LineChart(LineChartData(
        titlesData: FlTitlesData(
            show: true,
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
                showTitles: true,
                getTitles: (v) {
                  DateTime dt = DateTime.fromMillisecondsSinceEpoch(v as int);
                  return '${dt.day}/${dt.month}/${dt.year}';
                })),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: mood!.points
                .map((e) => FlSpot(
                    e.dateTime.millisecondsSinceEpoch as double, e.value))
                .toList(),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 400,
        height: 200,
        padding: EdgeInsets.all(16),
        child: _generateChart());
  }
}

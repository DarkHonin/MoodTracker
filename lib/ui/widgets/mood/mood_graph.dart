import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:mood_tracker/models/mood.dart';
import 'package:mood_tracker/models/mood_point.dart';

class MoodGraph extends StatelessWidget {
  final Mood? mood;

  const MoodGraph(
    this.mood, {
    Key? key,
  }) : super(key: key);

  String _padNumber(int D, int P) {
    return D.toString().padLeft(P, "0");
  }

  Widget _generateChart() {
    DateTime minDate = mood?.points[0].dateTime ?? DateTime.now();

    List<MoodPoint> items = mood!.points.where((element) {
      DateTimeRange DTR = DateTimeRange(start: minDate, end: element.dateTime);
      return DTR.duration < Duration(days: 1);
    }).toList();
    TextStyle textStyle = TextStyle(fontWeight: FontWeight.bold);
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(
            show: true,
            topTitles: SideTitles(showTitles: false),
            rightTitles: SideTitles(showTitles: false),
            bottomTitles: SideTitles(
                rotateAngle: 45,
                getTextStyles: (c, d) {
                  return textStyle;
                },
                showTitles: true,
                getTitles: (v) {
                  DateTimeRange DTR = DateTimeRange(
                      start: minDate,
                      end: DateTime.fromMillisecondsSinceEpoch(v as int));
                  if (DTR.duration < Duration(days: 1)) {
                    return '${_padNumber(DTR.end.hour, 2)}:${_padNumber(DTR.end.minute, 2)}:${_padNumber(DTR.end.second, 2)}';
                  }
                  return '${_padNumber(DTR.end.day, 2)}/${_padNumber(DTR.end.month, 2)}/${_padNumber(DTR.end.year, 4)}';
                })),
        borderData: FlBorderData(show: false),
        maxX: DateTime.now().millisecondsSinceEpoch as double,
        minX: minDate.millisecondsSinceEpoch as double,
        minY: -5,
        maxY: 5,
        lineBarsData: [
          LineChartBarData(
            spots: items
                .map((e) => FlSpot(
                    e.dateTime.millisecondsSinceEpoch as double, e.value))
                .toList(),
          )
        ],
      ),
    );
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

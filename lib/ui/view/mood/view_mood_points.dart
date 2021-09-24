import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/moodStore/mood_store_cubit.dart';
import 'package:mood_tracker/cubits/moods/moods_cubit.dart';
import 'package:mood_tracker/models/mood_point.dart';
import 'package:mood_tracker/ui/widgets/mood_point_chart.dart';

class MoodPointsView extends StatefulWidget {
  final String mood;
  const MoodPointsView(this.mood, {Key? key}) : super(key: key);

  @override
  _MoodPointsViewState createState() => _MoodPointsViewState();
}

class _MoodPointsViewState extends State<MoodPointsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MoodsCubit cubit = sl<MoodsCubit>();
    return Scaffold(
      appBar: AppBar(title: Text(widget.mood)),
      body:
          // MoodPointChart(cubit.state.moods[widget.mood]),
          ListView.builder(
              itemCount: cubit.state.moods[widget.mood]!.points.length + 1,
              itemBuilder: (c, i) {
                if (i == 0)
                  return MoodPointChart(cubit.state.moods[widget.mood]);
                MoodPoint e = cubit.state.moods[widget.mood]!.points[i - 1];
                return ListTile(
                  title: Text(
                      '${e.dateTime.day}/${e.dateTime.month}/${e.dateTime.year}'),
                  trailing: Text(e.value.toString()),
                );
              }),
    );
  }
}

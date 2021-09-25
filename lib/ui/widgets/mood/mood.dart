import 'package:flutter/material.dart';
import 'package:mood_tracker/models/mood.dart';
import 'package:mood_tracker/ui/widgets/mood/mood_graph.dart';
import 'package:mood_tracker/ui/widgets/mood/mood_title.dart';

class MoodWidget extends StatelessWidget {
  final Mood mood;
  const MoodWidget(this.mood, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        MoodGraph(mood),
        Align(alignment: Alignment.topLeft, child: MoodTitle(mood.name))
      ],
    ));
  }
}

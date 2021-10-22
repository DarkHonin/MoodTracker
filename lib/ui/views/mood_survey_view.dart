import 'package:flutter/material.dart';
import 'package:mood_tracker/models/mood.dart';
import 'package:mood_tracker/ui/widgets/mood_slider.dart';

class MoodSurveyView extends StatelessWidget {
  const MoodSurveyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MoodSurvey")),
      body: ListView.builder(
          itemCount: 1, // TODO moodsCubit, get, total moods
          itemBuilder: (c, i) {
            // TODO array index -> Mood
            final Mood _moodIn = Mood("Happy", []);
            return MoodSlider(title: _moodIn.name); // TODO ???
          }),
    );
  }
}

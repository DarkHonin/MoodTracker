import 'package:flutter/material.dart';
import 'package:mood_tracker/models/mood.dart';

class MoodListView extends StatelessWidget {
  const MoodListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MoodListView"),
          actions: [
            IconButton(
                onPressed: () {
                  // TODO show dialog create mood
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: ListView.builder(
            itemCount: 1, // TODO moodsCubit, get, total moods
            itemBuilder: (c, i) {
              // TODO array index -> Mood
              final Mood _moodIn = Mood("Happy", []);

              return ListTile(title: Text(_moodIn.name));
            }));
  }
}

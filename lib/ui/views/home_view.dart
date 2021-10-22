import 'package:flutter/material.dart';
import 'package:mood_tracker/core/navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget factory_button(context, title, name) {
    return Padding(
      padding: EdgeInsets.all(24),
      child: ListTile(
        title: Text(title),
        onTap: () {
          Navigator.pushNamed(context, name);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MoodTracker"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            factory_button(context, "MoodList", Navigation.MOODS_VIEW),
            factory_button(context, "MoodSurvey", Navigation.MOOD_SURVEY)
          ],
        ),
      ),
    );
  }
}

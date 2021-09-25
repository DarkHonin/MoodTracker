import 'package:flutter/material.dart';
import 'package:mood_tracker/core/navigation.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          Expanded(
              child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, Navigation.MOODS_VIEW);
                  },
                  child: Center(child: Text("Mood")),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, Navigation.CREATE_METRIC);
                  },
                  child: Center(child: Text("Survey")),
                ),
                MaterialButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, Navigation.CREATE_METRIC);
                  },
                  child: Center(child: Text("Activity")),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

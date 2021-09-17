import 'package:flutter/material.dart';

import 'package:mood_tracker/ui/widgets/mood_slider.dart';

class MoodMetric extends StatefulWidget {
  const MoodMetric({Key? key}) : super(key: key);

  @override
  _MoodMetricState createState() => _MoodMetricState();
}

class _MoodMetricState extends State<MoodMetric> {
  @override
  Widget build(BuildContext context) {

    


    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400,
          child: ListView(
            children: [],
          ),
        ),
      ),
    );
  }
}

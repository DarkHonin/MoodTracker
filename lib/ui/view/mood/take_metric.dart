import 'package:flutter/material.dart';

class MoodMetric extends StatefulWidget {
  const MoodMetric({Key? key}) : super(key: key);

  @override
  _MoodMetricState createState() => _MoodMetricState();
}

class _MoodMetricState extends State<MoodMetric> {
  Widget _moodMetrictSlider(
    String title,
  ) {
    return Column(children: [
      Text(title),
    ]);
  }

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

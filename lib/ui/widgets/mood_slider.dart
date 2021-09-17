import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  final String title;
  const MoodSlider({Key? key, required this.title}) : super(key: key);

  @override
  _MoodSliderState createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: -5,
      max: 5,
      value: value,
      divisions: 10,
      onChanged: (v) {
        setState(() {
          value = v;
        });
      },
    );
  }
}

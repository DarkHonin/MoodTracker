import 'package:flutter/material.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/cubits/moodStore/mood_store_cubit.dart';

class MoodSlider extends StatefulWidget {
  final String title;
  const MoodSlider({Key? key, required this.title}) : super(key: key);

  @override
  _MoodSliderState createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  double value = 0;

  @override
  void initState() {
    super.initState();
    sl<MoodStoreCubit>().setMoodValue(widget.title, value);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fitWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title,
                style: TextStyle(decoration: TextDecoration.underline)),
            Row(
              children: [
                SizedBox(child: Text(value.toString()), width: 25),
                Slider(
                  min: -5,
                  max: 5,
                  value: value,
                  divisions: 10,
                  onChanged: (v) {
                    setState(() {
                      value = v;
                      sl<MoodStoreCubit>().setMoodValue(widget.title, v);
                    });
                  },
                )
              ],
            )
          ],
        ));
  }
}

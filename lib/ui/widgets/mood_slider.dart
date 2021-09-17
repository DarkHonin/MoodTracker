import 'package:flutter/material.dart';

class MoodSlider extends StatefulWidget {
  final String title;
  final Function(String, double) callback;
  const MoodSlider({Key? key, required this.title, required this.callback}) : super(key: key);

  @override
  _MoodSliderState createState() => _MoodSliderState();
}

class _MoodSliderState extends State<MoodSlider> {
  double value = 0;
  @override
  Widget build(BuildContext context) {
    return FittedBox(
        fit: BoxFit.fitWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.title, style: TextStyle(decoration: TextDecoration.underline)),
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
                      widget.callback(widget.title, v);
                    });
                  },
                )
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class MoodTitle extends StatelessWidget {
  final String title;
  const MoodTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontSize: 24);
    return Container(
        padding: EdgeInsets.all(8),
        color: Color.fromARGB(125, 255, 255, 255),
        child: Text(
          title,
          style: style,
        ));
  }
}

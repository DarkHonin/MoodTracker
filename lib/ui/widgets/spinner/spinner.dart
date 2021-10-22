import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mood_tracker/ui/widgets/spinner/painter.dart';

class Spinner extends StatefulWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  _SpinnerState createState() => _SpinnerState();
}

class _SpinnerState extends State<Spinner> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: CustomPaint(
        painter: SpinnerPainer(),
      ),
    );
  }
}

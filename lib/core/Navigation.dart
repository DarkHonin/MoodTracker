// ignore: file_names
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mood_tracker/ui/view/home_view.dart';
import 'package:mood_tracker/ui/view/mood/create_mood.dart';

class Navigation {
  static const HOME_VIEW = '/';
  static const CREATE_MOOD_VIEW = '/mood/create';
  static const String MOOD_VIEW = '/mood';

  static Route<RouteSettings> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_VIEW:
        return _endpoint(HomeView());
      case CREATE_MOOD_VIEW:
        return _endpoint(MoodCreate());
      default:
        return _endpoint(Text("Whoops"));
    }
  }

  static Route<RouteSettings> _endpoint(Widget b) {
    return MaterialPageRoute(builder: (c) => b);
  }
}

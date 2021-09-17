// ignore: file_names
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mood_tracker/ui/view/home_view.dart';
import 'package:mood_tracker/ui/view/mood/moods_list.dart';
import 'package:mood_tracker/ui/view/mood/take_metric.dart';

class Navigation {
  static const HOME_VIEW = '/';
  static const CREATE_METRIC = '/mood/create';
  static const MOODS_VIEW = '/moods';

  static Route<RouteSettings> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_VIEW:
        return _endpoint(HomeView());
      case MOODS_VIEW:
        return _endpoint(MoodsView());
      case CREATE_METRIC:
        return _endpoint(MoodMetricView());
      default:
        return _endpoint(Text("Whoops"));
    }
  }

  static Route<RouteSettings> _endpoint(Widget b) {
    return MaterialPageRoute(builder: (c) => b);
  }
}

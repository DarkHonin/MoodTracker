// ignore: file_names
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mood_tracker/ui/views/home_view.dart';
import 'package:mood_tracker/ui/views/mood_list_view.dart';
import 'package:mood_tracker/ui/views/mood_survey_view.dart';

class Navigation {
  static const HOME_VIEW = '/';
  static const MOOD_SURVEY = '/mood/survey';
  static const MOOD_HISTORY = '/mood/history';
  static const MOODS_VIEW = '/mood';

  static Route<RouteSettings> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_VIEW:
        return _endpoint(HomeView());
      case MOODS_VIEW:
        return _endpoint(MoodListView());
      case MOOD_SURVEY:
        return _endpoint(MoodSurveyView());
      default:
        return _endpoint(Text("Whoops"));
    }
  }

  static Route<RouteSettings> _endpoint(Widget b) {
    return MaterialPageRoute(builder: (c) => b);
  }
}

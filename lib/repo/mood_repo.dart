import 'package:mood_tracker/models/mood.dart';

abstract class MoodRepo {
  bool _hasLoaded = false;

  bool hasLoaded() {
    return _hasLoaded;
  }

  init() {
    load();
    _hasLoaded = true;
  }

  Map<String, dynamic> load();
  save(Map<String, dynamic> moods);
}

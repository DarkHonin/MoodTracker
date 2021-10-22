import 'dart:convert';
import 'package:mood_tracker/repo/mood_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageMoodRepo extends MoodRepo {
  @override
  load() async {
    SharedPreferences p = await SharedPreferences.getInstance();
    if (!p.containsKey('moods')) {
      return {};
    }
    String mood = p.getString('moods')!;
    return jsonDecode(mood);
  }

  @override
  save(Map<String, dynamic> object) async {
    final prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(object);
    throw UnimplementedError();
  }
}

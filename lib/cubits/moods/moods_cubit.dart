import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:mood_tracker/models/mood.dart';
import 'package:mood_tracker/models/mood_point.dart';
import 'package:mood_tracker/ui/widgets/mood_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './moods_state.dart';

class MoodsCubit extends Cubit<MoodsState> {
  MoodsCubit() : super(MoodsState({}, ''));

  loadMoods() async {
    emit(MoodsLoadingState(state));
    try {
      final prefs = await SharedPreferences.getInstance();
      String rawJson = prefs.getString('moods') ?? '';

      Map<String, dynamic> preParse = jsonDecode(rawJson);

      Map<String, Mood> moods =
          preParse.map((k, e) => MapEntry(k, Mood.fromJson(e)));
      emit(MoodsLoadedState(moods, state));
    } catch (e) {
      print(e);
      emit(MoodsErrorState("No moods loaded", state));
    }
  }

  createMood(String moodName) async {
    state.moods[moodName] = (Mood(moodName, []));
    save();
    emit(MoodsLoadedState(state.moods, state));
  }

  addMoodPoint(String key, MoodPoint value) async {
    state.moods[key]?.points.add(value);
  }

  save() async {
    final prefs = await SharedPreferences.getInstance();
    String json = jsonEncode(
        state.moods.map((key, value) => MapEntry(key, value.toMap())));
    print(state.moods);
    prefs.setString('moods', json);
  }
}

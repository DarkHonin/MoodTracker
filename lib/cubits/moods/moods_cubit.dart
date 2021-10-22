import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mood_tracker/core/dependency_injection.dart';
import 'package:mood_tracker/entity/mood_store_entity.dart';

import 'package:mood_tracker/models/mood.dart';
import 'package:mood_tracker/models/mood_point.dart';
import 'package:mood_tracker/repo/local_storage_mood_repo.dart';
import 'package:mood_tracker/ui/widgets/mood_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './moods_state.dart';

class MoodsCubit extends Cubit<MoodsState> {
  final LocalStorageMoodRepo _repo = sl<LocalStorageMoodRepo>();
  MoodsCubit() : super(MoodsState(const MoodStoreEntity({})));

  loadMoods() async {
    emit(MoodsLoadingState(state.moodStore));
    try {
      Map<String, dynamic> rawJson = _repo.load();

      Map<String, Mood> moods =
          rawJson.map((k, e) => MapEntry(k, Mood.fromJson(e)));
      emit(MoodsLoadedState(state.moodStore.copyWith(moods: moods)));
    } catch (e) {
      print(e);
      emit(MoodsErrorState(const MoodStoreEntity({})));
    }
  }

  createMood(String moodName) async {
    emit(MoodsLoadingState(state.moodStore));
    state.moodStore.moods[moodName] = (Mood(moodName, []));

    Map<String, dynamic> store =
        state.moodStore.moods.map((key, value) => MapEntry(key, value.toMap()));

    _repo.save(store);
    emit(MoodsLoadedState(state.moodStore));
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

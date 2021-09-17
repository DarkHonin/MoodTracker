import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mood_tracker/models/mood.dart';
import 'package:shared_preferences/shared_preferences.dart';

part './moods_state.dart';

class MoodsCubit extends Cubit<MoodsState> {
  MoodsCubit() : super(MoodsState([], ''));

  loadMoods() async {
    emit(MoodsLoadingState(state));
    try {
      final prefs = await SharedPreferences.getInstance();
      String rawJson = prefs.getString('moods') ?? '';
      Map<String, dynamic> preParse = jsonDecode(rawJson);
      print(preParse);
      List<Mood> moods = (preParse['Moods'] as List<dynamic>).map((e) => Mood.fromJson(e)).toList();
      emit(MoodsLoadedState(moods, state));
    } catch (e) {
      print(e);
      emit(MoodsErrorState("No moods loaded", state));
    }
  }

  createMood(String moodName) async {
    final prefs = await SharedPreferences.getInstance();
    state.moods.add(Mood(moodName));
    Map<String, dynamic> data = {"Moods": state.moods};
    prefs.setString('moods', jsonEncode(data));
    emit(MoodsLoadedState(state.moods, state));
  }
}
